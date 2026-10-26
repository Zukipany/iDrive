// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import Observation

/// A trip the driver planned or drove: planned in the trip planner, said to Apple
/// Intelligence ("tomorrow morning I'm heading to Milan"), or finished.
nonisolated struct SavedTrip: Codable, Equatable, Identifiable, Sendable {
    enum Origin: String, Codable, Sendable { case planner, assistant }

    /// The result of the last plan, for the list.
    struct Summary: Codable, Equatable, Sendable {
        let distanceKm: Double
        let travelTime: TimeInterval
        let stops: Int
        let costLow: Double
        let costHigh: Double
        /// l or kWh per 100 km the plan used.
        let per100km: Double?
        let unit: String
    }

    var id
    var destinationName: String
    var destinationLatitude: Double
    var destinationLongitude: Double
    /// Nil: from wherever the driver is when it's planned.
    var startName: String?
    var startLatitude: Double?
    var startLongitude: Double?
    var departure: Date
    var createdAt
    var origin: Origin
    var summary: Summary?
    /// Set when the driver ended the trip after leaving.
    var finishedAt: Date?

    var destination: CLLocationCoordinate2D { /* private */ }
    var start: CLLocationCoordinate2D? { /* private */ }

    /// Still ahead: not finished, and leaving no more than 2 hours ago.
    func isUpcoming(now: Date = .now) -> Bool { /* private */ }
}

/// The saved trips, on the iPhone (`trips.json`).
@MainActor @Observable
final class TripLibrary {
    static let shared
    /// A trip that left this long ago without being finished still counts as upcoming.
    nonisolated static let upcomingGrace: TimeInterval
    /// At most this many past trips are kept.
    nonisolated static let maxPast

    private(set) var trips: [SavedTrip]
    private let file: URL?

    init(file: URL? = TripLibrary.defaultFile) { /* private */ }

    nonisolated static var defaultFile: URL? { /* private */ }

    /// Soonest first.
    func upcoming(now: Date = .now) -> [SavedTrip] { /* private */ }

    /// Latest first.
    func past(now: Date = .now) -> [SavedTrip] { /* private */ }

    /// Adds the trip, or updates the one with the same id.
    func save(_ trip: SavedTrip) { /* private */ }

    func delete(_ id: SavedTrip.ID) { /* private */ }

    /// Ending a trip that has started keeps it as a past trip; one still ahead stays planned.
    func finish(_ id: SavedTrip.ID, now: Date = .now) { /* private */ }

    private func write() { /* private */ }
}

nonisolated extension SavedTrip.Summary {
    init(plan: Trip.Plan, figure: TripConsumption.Figure?) { /* private */ }
}
