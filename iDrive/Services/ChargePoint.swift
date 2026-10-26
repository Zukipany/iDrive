// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// A charging location, independent of where the data came from.
/// `MobiDataAPI`, `NRELAPI`, `OpenChargeMapAPI` and `OverpassAPI` all decode into this type.
nonisolated struct ChargePoint: Identifiable, Hashable, Sendable {
    enum Source: String, Sendable {
        case mobiData, nrel, openChargeMap, openStreetMap

        /// Licence attribution, required by every source.
        var attribution: String { /* private */ }

        var shortAttribution: String { /* private */ }

        var url: URL { /* private */ }
    }

    struct Connection: Hashable, Sendable {
        /// "Type 2", "CCS", "CHAdeMO", … nil when the source doesn't say.
        let kind: String?
        /// nil when unknown, which is common in OpenStreetMap.
        let powerKW: Double?
        let quantity: Int
        let isDC: Bool
        /// Ad-hoc tariff, when the operator publishes one (MobiData BW only).
        var tariff: ChargingTariff?

        /// Adds up connectors of the same kind, power and tariff.
        static func combined(_ connections: [Connection]) -> [Connection] { /* private */ }
    }

    /// Live occupancy from the operator, e.g. 2 of 4 points free.
    struct Availability: Hashable, Sendable {
        let available: Int
        let total: Int
    }

    /// Prefixed with the source ("ocm-123", "osm-node-456") so IDs never collide.
    let id: String
    let source: Source
    let title: String
    let operatorName: String?
    /// Open Charge Map only; resolve via `/v3/referencedata` to show a name.
    let operatorID: Int?
    let addressLine: String?
    let town: String?
    let latitude: Double
    let longitude: Double
    /// km from the search point.
    let distanceKm: Double?
    /// Free text as reported by the source. Never treat it as a reliable price.
    let usageCost: String?
    let connections: [Connection]
    /// Nil when the source has no live status.
    var availability: Availability?
    /// The site's own name ("Tiefgarage Marienplatz") when it's readable and not just the address.
    var siteName: String?
    /// Not from the data source: the driver's cheapest charging plan here, when it beats the ad-hoc price.
    var plan: AppliedChargingPlan?

    var coordinate: CLLocationCoordinate2D { /* private */ }
    var maxPowerKW: Double? { /* private */ }
    /// DC when any connector is DC (CCS, CHAdeMO, …) or delivers 50 kW or more.
    var isFast: Bool { /* private */ }
    var chargeType: FuelType { /* private */ }
    var pointCount: Int { /* private */ }

    /// Power of the connectors that match `chargeType`. A DC station with an unlisted
    /// CCS power and a 22 kW Type 2 socket must not be labelled "22 kW".
    var labelPowerKW: Double? { /* private */ }

    /// The tariff of the connectors that match `chargeType`, cheapest first. A DC
    /// station that also has a Type 2 socket is priced by its DC connectors.
    var tariff: ChargingTariff? { /* private */ }

    /// Ad-hoc €/kWh (card payment, no contract), nil when the operator doesn't publish it.
    var adHocPricePerKWh: Double? { /* private */ }

    /// What the driver pays per kWh: their cheapest charging plan here, or the ad-hoc price
    /// when no plan beats it. Sorting, the cheapest pin and the averages all use this.
    var pricePerKWh: Double? { /* private */ }

    /// This charger with the cheapest of `plans`, kept only when it beats the ad-hoc price.
    func applyingPlans(_ plans: [ChargingPlan]) -> ChargePoint { /* private */ }

    /// "150 kW", or "DC" / "AC" when the power isn't known.
    var powerLabel: String { /* private */ }

    private static func isDCLike(_ connection: Connection) -> Bool { /* private */ }

    /// "CCS, Type 2"
    var connectorSummary: String? { /* private */ }

    /// "north-east" etc. from `origin`; helps tell sites apart when OSM has no address.
    func direction(from origin: CLLocationCoordinate2D) -> String { /* private */ }

    static func distanceKm(from origin: CLLocationCoordinate2D?, latitude: Double, longitude: Double) -> Double? { /* private */ }
}

/// One of the eight compass directions from one point to another.
nonisolated enum CompassDirection: Int, CaseIterable {
    case north, northEast, east, southEast, south, southWest, west, northWest

    /// Initial great-circle bearing, rounded to the nearest 45°.
    init(from a: CLLocationCoordinate2D, to b: CLLocationCoordinate2D) { /* private */ }

    var label: String { /* private */ }
}
