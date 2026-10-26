// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// The trip planner's data. Everything is Codable so an active trip survives losing the
/// network or the app being closed (measure 8a: the plan lives on the iPhone).
nonisolated enum Trip {
    /// What the car brings to the trip, already adjusted for speed and weather.
    struct Car: Codable, Equatable, Sendable {
        enum Kind: String, Codable, Sendable { case combustion, electric, plugInHybrid }

        let kind: Kind
        /// Litres for fuel (the petrol tank of a plug-in hybrid), kWh for an electric car.
        let capacity: Double
        /// 0…1 when leaving.
        let level: Double
        /// True when the level comes from the log, not the gauge (measure 1b: planned with a margin).
        let levelIsEstimated: Bool
        /// l or kWh per 100 km on this trip, after the speed and weather factors (measure 5).
        let per100km: Double
        /// Plug-in hybrids: km on the battery when leaving, used first (measure 7a).
        var electricKm: Double
        /// Electric cars: charge to this share at stops; above 80 % charging slows down (measure 6c).
        var chargeTo: Double
        /// Electric cars: the most the car takes at a DC charger, kW.
        var maxChargingKW: Double

        /// Units (l or kWh) per km.
        var perKm: Double { /* private */ }
        /// Km a stop can fill up to.
        var fullRangeKm: Double { /* private */ }
        /// Km in the tank or battery when leaving. An estimated level counts 85 %, so a
        /// gauge read a little high never leaves the car short (measure 1b).
        var startRangeKm: Double { /* private */ }
    }

    /// The share of an estimated level the planner relies on.
    static let estimatedLevelShare

    enum Preference: String, Codable, CaseIterable, Sendable { case cheapest, fewestStops }

    struct Settings: Codable, Equatable, Sendable {
        /// Never arrive anywhere with less (measure 1c).
        var reserveKm: Double
        /// Stations further off the route are left out.
        var maxDetourKm: Double
        var preference: Preference
        var departure: Date
        /// Stations the driver picked on the trip map: the plan has to stop there.
        var chosen: Set<String>
        /// Stations the driver swapped out: never planned again.
        var avoided: Set<String>
    }

    /// Weekly opening hours. Nil hours on a candidate mean "not known".
    struct OpeningHours: Codable, Hashable, Sendable {
        /// Minutes after midnight, per weekday (1 = Sunday … 7 = Saturday, as `Calendar`).
        struct Interval: Codable, Hashable, Sendable {
            let weekday: Int
            let opens: Int
            let closes: Int
        }

        let intervals: [Interval]
        let alwaysOpen: Bool

        static let twentyFourSeven

        func isOpen(at date: Date, calendar: Calendar = .current) -> Bool { /* private */ }
    }

    /// A place to fuel or charge near the route.
    struct Candidate: Codable, Equatable, Identifiable, Sendable {
        let id: String
        let name: String
        let address: String?
        let latitude: Double
        let longitude: Double
        /// km from the start where the driver leaves the route for it.
        let kmAlong: Double
        /// Extra km there and back (measure 2c widens this where stations are rare).
        let detourKm: Double
        /// €/l or €/kWh; nil when no source reports one (Apple Maps places, countries without data).
        let price: Double?
        /// When the price was published, for its age at arrival (measure 4a).
        let priceDate: Date?
        let hours: OpeningHours?
        /// Electric: the charger's DC power, kW.
        var chargingKW: Double?
        /// Electric: false when the source doesn't list the plugs (measure 6a).
        var plugConfirmed
        /// Who reported it: "Tankerkönig", "E-Control", "Apple Maps"…
        var source: String

        var coordinate: CLLocationCoordinate2D { /* private */ }
    }

    enum StopNote: String, Codable, Sendable, Hashable {
        /// Arrives with less than the reserve: the nearest station, not the cheapest (measure 1c).
        case critical
        /// The last station before a long stretch without any (measure 2a): fills up completely (2b).
        case lastBeforeGap
        /// Opening hours unknown and arriving at night (measure 3b).
        case mayBeClosed
        /// The price is hours old by arrival: an estimate (measure 4a).
        case priceMayChange
        /// No price published here; chosen because it's needed (measure 2c).
        case noPrice
        /// The charger's plugs aren't listed (measure 6a).
        case plugUnconfirmed
    }

    struct Stop: Codable, Equatable, Identifiable, Sendable {
        let candidate: Candidate
        let eta: Date
        /// km left when arriving at the station.
        let arrivalRangeKm: Double
        /// Litres or kWh to fill.
        let amount: Double
        /// €; nil without a price.
        let cost: Double?
        /// Minutes at the stop: 6 for fuel, the charging time for an electric car (measure 6c).
        let minutes: Double
        let notes: Set<StopNote>
        /// The next-best station on the same stretch, if this one is closed (measure 3c).
        let backup: Candidate?
        /// Set when the driver has been there (measure 9b).
        var isDone

        var id: String { /* private */ }
    }

    enum Warning: Codable, Equatable, Sendable, Hashable {
        /// The car can't reach any station on the route with its reserve (measure 1a).
        case fillUpBeforeLeaving
        /// No station reachable for this stretch even with a full tank (measure 2a).
        case cannotReach(fromKm: Double, gapKm: Double)
        /// The level when leaving is an estimate (measure 1b).
        case levelEstimated
        /// Stations left out because they're closed on arrival (measure 3a).
        case closedOnArrival(count: Int)

        /// The trip can't be driven as planned until the driver acts.
        var isBlocking: Bool { /* private */ }
    }

    struct Plan: Codable, Equatable, Sendable {
        let distanceKm: Double
        let travelTime: TimeInterval
        var stops: [Stop]
        let warnings: [Warning]
        /// km left at the destination.
        let arrivalRangeKm: Double
        /// € for everything bought, low and high with price changes until arrival (measure 4a).
        let costLow: Double
        let costHigh: Double
        let car: Car
        let settings: Settings

        var arrivalTime: Date { /* private */ }

        /// The first stop not done yet (measure 9a/9b).
        var nextStop: Stop? { /* private */ }

        /// This plan with a stop ticked off: by the driver, or when a fill-up is logged there (9b).
        func markingDone(_ id: Stop.ID) -> Plan { /* private */ }
    }
}
