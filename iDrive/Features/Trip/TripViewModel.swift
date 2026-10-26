// Source code is private. This file shows only its types and signatures.

import CoreLocation
import MapKit
import Observation

/// What the driver chooses before planning. Nil level or battery: estimated from the log (1b).
struct TripOptions: Equatable {
    var departure
    /// 0…1 read off the gauge; nil: estimate from the log.
    var level: Double?
    var batteryLevel: Double?
    var reserveKm
    var maxDetourKm
    var preference
    var plug
    var minimumKW
    var chargeTo
    var maxChargingKW
}

/// Plans a trip and follows it while driving: progress, price checks near the next stop,
/// skipped stops, offline. The plan is saved after every change (8a).
@MainActor @Observable
final class TripViewModel {
    enum Phase: Equatable {
        case idle
        case routing
        case searching(TripStationFinder.Progress)
        case ready
        case failed(String)
    }

    private(set) var phase: Phase
    private(set) var trip: ActiveTrip?
    /// The figure the plan used, for the summary line (5).
    private(set) var figure: TripConsumption.Figure?
    /// Something that changed on the way: "Passed Kufstein: planned again." (4b, 9b).
    private(set) var notice: String?

    /// The driver's fuel cards and charging plans, for prices after discounts.
    var discountCards: [DiscountCard]
    var chargingPlans: [ChargingPlan]

    private let finder: TripStationFinder
    private var search: Task<Void, Never>?
    private var isRechecking

    init(finder: TripStationFinder = TripStationFinder()) { /* private */ }

    var isActive: Bool { /* private */ }

    // MARK: Planning

    /// - Parameter saved: the saved trip this plans (opened from the list); nil saves a new one.
    func plan(
        from origin: CLLocationCoordinate2D,
        to destination: MKMapItem,
        vehicle: Vehicle,
        options: TripOptions,
        discounts: [DiscountCard],
        plans: [ChargingPlan],
        saved: SavedTrip? = nil
    ) { /* private */ }

    /// What a plan needs before the stations: the route, the weather along it, the car's
    /// figures (from its learned model when there is one) and the station search.
    private struct Setup {
        let route: RouteProfile
        let car: Trip.Car
        let figure: TripConsumption.Figure
        let weather: TripWeather.Summary?
        let request: TripStationFinder.Request

        func trip(to destination: MKMapItem, candidates: [Trip.Candidate], savedTripID: UUID) -> ActiveTrip { /* private */ }
    }

    private func prepare(
        from origin: CLLocationCoordinate2D,
        to destination: MKMapItem,
        vehicle: Vehicle,
        options: TripOptions,
        discounts: [DiscountCard],
        plans: [ChargingPlan]
    ) async throws -> Setup { /* private */ }

    func endTrip() { /* private */ }

    /// Ticked off by the driver, or because a fill-up was logged there (9b, 9c).
    func markDone(_ stopID: Trip.Stop.ID) { /* private */ }

    // MARK: Choosing stations on the trip map

    /// The plan if the driver stops at `candidate` instead of the planned stop nearest to it,
    /// from where the car is now. Nil without a trip.
    func trial(choosing candidate: Trip.Candidate) -> (plan: Trip.Plan, replaced: Trip.Stop?)? { /* private */ }

    /// Keeps a plan made on the trip map.
    func apply(_ plan: Trip.Plan) { /* private */ }

    // MARK: On the way

    /// Called with each new location while the trip is open.
    func update(location: CLLocationCoordinate2D, isOnline: Bool) async { /* private */ }

    /// 4b: new prices around the next stop, then the rest planned again with them.
    private func recheck(_ stop: Trip.Stop, fromKm km: Double) async { /* private */ }

    /// The rest of the trip planned again from `km` with what's in the tank by then.
    private func replan(fromKm km: Double) { /* private */ }
}
