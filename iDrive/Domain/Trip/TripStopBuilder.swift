// Source code is private. This file shows only its types and signatures.

import Foundation

/// Turns the solver's legs into the stops the driver sees: arrival time, litres or kWh,
/// cost, notes and a backup station.
nonisolated struct TripStopBuilder {
    let solver: TripSolver
    let route: RouteProfile
    let settings: Trip.Settings
    let calendar: Calendar

    func stops(for legs: [TripSolver.Leg]) -> [Trip.Stop] { /* private */ }

    private func notes(_ candidate: Trip.Candidate, node: Int, arrival: Double, eta: Date) -> Set<Trip.StopNote> { /* private */ }

    /// The best other station on the same stretch (3c): reachable with what the car left the
    /// stop before with, open on arrival, able to reach the next stop after filling up.
    private func backup(for node: Int, previous: TripSolver.Leg, next: Int, eta: Date) -> Trip.Candidate? { /* private */ }
}
