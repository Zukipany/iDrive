// Source code is private. This file shows only its types and signatures.

import CoreLocation
import MapKit
import Network
import Observation

nonisolated enum TripError: LocalizedError, Equatable {
    case noRoute

    var errorDescription: String? { /* private */ }
}

/// The driving route from Apple Maps.
enum TripRouting {
    @MainActor
    static func route(from origin: CLLocationCoordinate2D, to destination: MKMapItem) async throws -> RouteProfile { /* private */ }

    /// Fuel stations or chargers Apple Maps knows within `radiusKm`, without prices (2c).
    @MainActor
    static func places(near coordinate: CLLocationCoordinate2D, radiusKm: Double, chargers: Bool) async throws
        -> [(id: String, name: String, coordinate: CLLocationCoordinate2D)] { /* private */ }
}

/// Finds stations or chargers along a route, priced where a source covers the country.
/// Results arrive in steps, so the plan can show (and improve) while Tankerkönig's
/// one-request-a-minute limit runs.
@MainActor
final class TripStationFinder {
    struct Progress: Equatable, Sendable {
        let done: Int
        let total: Int
        /// Waiting for Tankerkönig's next allowed request.
        var waitsUntil: Date?
    }

    struct Request {
        let route: RouteProfile
        let car: Trip.Car
        let settings: Trip.Settings
        /// The car's fuels, its usual one first.
        let fuels: [FuelType]
        let plug: TripConsumption.Plug
        let minimumKW: Double
        let discounts: [DiscountCard]
        let plans: [ChargingPlan]
    }

    typealias PlaceSearch =
        @MainActor (CLLocationCoordinate2D, Double, Bool) async throws
        -> [(id: String, name: String, coordinate: CLLocationCoordinate2D)]

    private let tankerkoenig: TankerkoenigService
    private let countryFuel: CountryFuelService
    private let chargeMap: ChargeMapService
    private let locator: CountryLocator
    private let places: PlaceSearch

    init(
        tankerkoenig: TankerkoenigService = .shared,
        countryFuel: CountryFuelService = CountryFuelService(),
        chargeMap: ChargeMapService = ChargeMapService(),
        locator: CountryLocator = CountryLocator(),
        places: @escaping PlaceSearch = TripRouting.places
    ) { /* private */ }

    func candidates(for request: Request, update: ([Trip.Candidate], Progress) -> Void) async { /* private */ }

    /// `km` on the route, or up to 320 km before it, in a country with a fuel price source:
    /// Munich–Venice runs ~200 km through Italy, which has none, after the Brenner.
    /// Chargers come from several sources everywhere, so they're searched where asked.
    private func coveredPoint(near km: Double, route: RouteProfile, electric: Bool) async -> CLLocationCoordinate2D? { /* private */ }

    /// Priced stations or chargers around one point: the check near the next stop (4b).
    func priced(near point: CLLocationCoordinate2D, request: Request) async -> [Trip.Candidate] { /* private */ }

    private static func unique(_ candidates: [Trip.Candidate]) -> [Trip.Candidate] { /* private */ }

    private func stations(
        near point: CLLocationCoordinate2D,
        _ request: Request,
        waiting: (Date) -> Void
    ) async -> [Trip.Candidate] { /* private */ }

    private func chargers(near point: CLLocationCoordinate2D, _ request: Request) async -> [Trip.Candidate] { /* private */ }
}

/// The active trip, saved on the iPhone so it works without a network and after a restart (8a).
nonisolated struct ActiveTrip: Codable, Equatable, Sendable {
    let destinationName: String
    let destinationLatitude: Double
    let destinationLongitude: Double
    var plan: Trip.Plan
    var route: RouteProfile
    var candidates: [Trip.Candidate]
    /// When each stop's prices were last checked on the way (4b).
    var lastPriceCheck: [String: Date]
    /// How far along the route the car was last seen.
    var progressKm: Double
    /// What the searches need again on the way (4b).
    var fuels: [FuelType]
    var plug: TripConsumption.Plug
    var minimumKW
    /// The entry in the saved trips this plan belongs to.
    var savedTripID: UUID?
    /// The forecast the plan used (5b); nil when planned by season or by hand.
    var weather: TripWeather.Summary?
    /// The consumption the plan used, for the summary line after a restart.
    var figure: TripConsumption.Figure?

    var destination: CLLocationCoordinate2D { /* private */ }
}

enum TripStore {
    private static var url: URL? { /* private */ }

    static func load() -> ActiveTrip? { /* private */ }

    static func save(_ trip: ActiveTrip?) { /* private */ }
}

/// Whether the iPhone is online, so the trip says "offline" instead of failing quietly (8c).
@MainActor @Observable
final class Connectivity {
    static let shared
    private(set) var isOnline
    private let monitor

    private init() { /* private */ }
}
