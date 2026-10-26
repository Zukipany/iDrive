// Source code is private. This file shows only its types and signatures.

import Foundation

/// The trip while driving: where the car is, what's left, and when to look again.
nonisolated enum TripProgress {
    /// Check the next stop's prices again once it's this close (4b)…
    static let recheckWithinKm
    /// …and the last check is this old.
    static let recheckAfter: TimeInterval
    /// A stop the car is this far past without being ticked off was skipped (9b).
    static let passedByKm

    /// km in the tank at `km`, if the stops ticked off so far were filled as planned and the
    /// others weren't.
    static func expectedRange(_ plan: Trip.Plan, atKm km: Double) -> Double { /* private */ }

    /// The next stop when it's close and its prices are old (4b).
    static func stopToRecheck(_ plan: Trip.Plan, progressKm: Double, lastCheck: [String: Date], now: Date = .now) -> Trip.Stop? { /* private */ }

    /// A stop the car drove past without it being ticked off (9b): the plan has to change,
    /// as the tank wasn't filled there.
    static func skippedStop(_ plan: Trip.Plan, progressKm: Double) -> Trip.Stop? { /* private */ }

    /// The car for planning the rest of the trip from `km`: the expected range as an exact
    /// level (the estimate margin was applied when leaving).
    static func carFrom(_ plan: Trip.Plan, atKm km: Double) -> Trip.Car { /* private */ }

    /// The rest of the route from `km`, with km counted from there.
    static func remainder(_ route: RouteProfile, fromKm km: Double) -> RouteProfile { /* private */ }

    /// Candidates ahead of `km`, with km counted from there.
    static func candidates(_ candidates: [Trip.Candidate], aheadOf km: Double) -> [Trip.Candidate] { /* private */ }
}
