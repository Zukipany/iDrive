// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

// MARK: - DTOs

nonisolated struct StationListResponse: Decodable, Sendable {
    let ok: Bool
    let message: String?
    let stations: [Station]?
}

/// A fuel station from Tankerkönig `list.php?type=all`, or built from another country's
/// price database (`source`).
nonisolated struct Station: Decodable, Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let brand: String
    let street: String
    let houseNumber: String?
    let place: String
    let lat: Double
    let lng: Double
    /// km from the search point.
    let dist: Double
    let isOpen: Bool
    let e5: FlexiblePrice?
    let e10: FlexiblePrice?
    let diesel: FlexiblePrice?
    /// Not from Tankerkönig: set by the map from the brand and OpenStreetMap.
    var premiumDiesel: PremiumDiesel.Availability?
    /// Not from Tankerkönig: the driver's best fuel-card discount here, per fuel.
    var discounts: [FuelType: AppliedDiscount]
    /// Where the prices come from; everything decoded from JSON is Tankerkönig.
    var source: FuelPriceSource
    /// A premium diesel price the station reported itself (Spain's "Gasóleo Premium").
    var premiumDieselPrice: Double?
    /// Weekly hours where the source has them (Austria, Spain); nil when unknown.
    var openingHours: Trip.OpeningHours?

    private enum CodingKeys: String, CodingKey {
        case id, name, brand, street, houseNumber, place, lat, lng, dist, isOpen, e5, e10, diesel
    }

    var coordinate: CLLocationCoordinate2D { /* private */ }

    /// Brand when known, otherwise the station name ("" brands are common for independents).
    var displayName: String { /* private */ }

    /// "Leopoldstr. 12, München"; parts a source leaves empty are skipped, never ", ".
    var address: String { /* private */ }

    /// This station with the best discount of `cards` for each fuel it sells.
    func applyingDiscounts(_ cards: [DiscountCard], on date: Date = .now) -> Station { /* private */ }

    /// What the driver pays per litre: the board price minus their best fuel-card
    /// discount. Sorting, the cheapest pin, averages and the widget all use this.
    func price(for fuel: FuelType) -> Double? { /* private */ }

    /// €/l on the price board, for a combustion fuel; nil for electric or when the station
    /// doesn't sell it. Premium diesel is an estimate (see `FuelType.isPriceEstimated`)
    /// unless the station reported it: German stations don't report it to the MTS-K.
    func pumpPrice(for fuel: FuelType) -> Double? { /* private */ }

    /// True when this station's price for `fuel` is an estimate, shown with "≈".
    func isEstimate(_ fuel: FuelType) -> Bool { /* private */ }
}

/// Tankerkönig sends a missing price as `false` (or `null`) instead of a number. A price
/// of 0 (or less) is a reporting error, never free fuel, so it counts as missing too:
/// otherwise it would be the cheapest pin on the map.
nonisolated struct FlexiblePrice: Decodable, Hashable, Sendable {
    let value: Double?

    init(_ value: Double?) { /* private */ }

    init(from decoder: any Decoder) throws { /* private */ }
}

nonisolated enum TankerkoenigError: LocalizedError, Equatable {
    case api(String)
    case badResponse
    /// Another request ran less than a minute ago (fair use); try again shortly.
    case tooSoon

    var errorDescription: String? { /* private */ }
}

/// Current prices of one station from `prices.php`.
nonisolated struct StationPrices: Decodable, Hashable, Sendable {
    /// "open", "closed" or "no prices".
    let status: String
    let e5: FlexiblePrice?
    let e10: FlexiblePrice?
    let diesel: FlexiblePrice?

    var isOpen: Bool { /* private */ }

    func price(for fuel: FuelType) -> Double? { /* private */ }
}

nonisolated struct StationPricesResponse: Decodable, Sendable {
    let ok: Bool
    let message: String?
    let prices: [String: StationPrices]?
}

// MARK: - Service

/// Fuel prices for Germany from Tankerkönig (MTS-K data, CC BY 4.0).
///
/// Fair-use rules from creativecommons.tankerkoenig.de, enforced here:
/// - at most one request per minute; inside that window the newest cached result is returned
/// - results are cached for 5 minutes and reused within 500 m
/// - `type=all` so one call carries E5, E10 and Diesel and switching fuel chips never hits the network
/// - requests only on user action (the caller decides when; there is no polling loop)
actor TankerkoenigService {
    /// One instance for the map and the trip planner, so together they never ask more than
    /// once a minute.
    static let shared

    struct Result: Sendable {
        let stations: [Station]
        let fetchedAt: Date
        /// True when served from cache because of the rate limit or a fresh cache entry.
        let fromCache: Bool
        /// Set when the request failed and older cached prices stand in: why it failed.
        var staleBecause: String?
    }

    /// `prices.php` takes at most 10 stations per request.
    static let maxPriceIDs

    static let attributionURL
    static let maxRadiusKm

    private let apiKey: String
    private let fetch: HTTP.Fetcher
    private let now: @Sendable () -> Date
    private let minimumInterval: TimeInterval
    private let cacheLifetime: TimeInterval

    private var cache
    private var lastNetworkRequest: Date

    init(
        apiKey: String = APIConfig.tankerkoenigKey,
        fetch: @escaping HTTP.Fetcher = HTTP.data(for:),
        now: @escaping @Sendable () -> Date = { }
    ) { /* private */ }

    func stations(
        near coordinate: CLLocationCoordinate2D,
        radiusKm: Double,
        forceRefresh: Bool = false
    ) async throws -> Result { /* private */ }

    /// When the next request is allowed (fair use: one a minute).
    var nextRequestAllowed: Date { /* private */ }

    /// Waits for the next allowed request, then loads the stations there. For places the
    /// app hasn't looked at before (the trip planner): within the minute the map would get
    /// another place's cached list instead.
    func stationsWaitingForSlot(near coordinate: CLLocationCoordinate2D, radiusKm: Double) async throws -> Result { /* private */ }

    /// Current prices of up to 10 stations (favourites outside the search radius). Counts
    /// towards the one-request-per-minute limit like a list request.
    func prices(ids: [String]) async throws -> [String: StationPrices] { /* private */ }

    // MARK: Pure helpers (unit-tested)

    static func listURL(_ coordinate: CLLocationCoordinate2D, radiusKm: Double, apiKey: String) -> URL { /* private */ }

    static func pricesURL(ids: [String], apiKey: String) -> URL { /* private */ }

    static func decodeStations(from data: Data) throws -> [Station] { /* private */ }
}
