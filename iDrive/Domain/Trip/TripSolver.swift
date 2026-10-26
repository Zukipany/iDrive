// Source code is private. This file shows only its types and signatures.

import Foundation

/// The search behind `TripPlanner`: the cheapest way from the start to the destination over
/// the candidate stations, where each stop fills up or buys just enough for the next leg.
nonisolated final class TripSolver {
    /// Node 0 is the start (nothing to buy), 1…n the candidates, n + 1 the destination.
    struct Node {
        let km: Double
        let halfDetour: Double
        /// € per km of range bought here.
        let pricePerKm: Double
        /// € the stop costs on top of the fuel (4c, 3b).
        let penalty: Double
        /// km of range after filling up here (a plug-in hybrid adds what's left on the battery).
        let fullRange: Double
        /// The last station before a long stretch without any: it fills up (2b).
        let beforeGap: Bool
    }

    /// One leg of the result: from a node, what was bought there, where it goes, and the km
    /// left on arrival.
    struct Leg: Equatable {
        let from: Int
        let boughtKm: Double
        let to: Int
        let arrival: Double
    }

    let candidates: [Trip.Candidate]
    let nodes: [Node]
    /// Nodes the plan must stop at: stations the driver picked.
    let required: [Int]
    let car: Trip.Car
    let settings: Trip.Settings
    private var memo: [Key: (cost: Double, leg: Leg?)]
    private var reserveFirst

    private struct Key: Hashable {
        let node: Int
        let arrival: Int
    }

    init(
        candidates: [Trip.Candidate],
        car: Trip.Car,
        settings: Trip.Settings,
        distance: Double,
        nightRisk: (Trip.Candidate) -> Bool
    ) { /* private */ }

    /// The candidate the start reaches with the fewest km (1c).
    private var nearestStation: Int? { /* private */ }

    /// No leg may skip a station the driver picked.
    private func lastAllowed(after node: Int) -> Int { /* private */ }

    /// Driving km from node `i` to node `j`, including both detours.
    func distance(_ i: Int, _ j: Int) -> Double { /* private */ }

    var destination: Int { /* private */ }

    /// The legs of the cheapest plan, or nil when the destination can't be reached.
    /// - Parameter firstReserve: what the car must still have at the first stop (0 for 1c).
    func solve(firstReserve: Double) -> [Leg]? { /* private */ }

    private static func rounded(_ km: Double) -> Int { /* private */ }

    /// Cheapest € from `node` (just arrived with `arrival` km) to the destination.
    private func cost(from node: Int, arrival: Double) -> Double { /* private */ }

    /// The start can't sell fuel: the car leaves with what it has. Only a station may be
    /// reached on the reserve (1c), never the destination, and then the nearest one: no
    /// gamble on a cheaper one further on.
    private func fromStart(arrival: Double, reserve: Double) -> (cost: Double, leg: Leg?) { /* private */ }

    /// Fill up, or buy just enough for the leg plus the reserve. Before a long gap only fill up (2b).
    private func purchases(at node: Int, arrival: Double, leg: Double) -> [Double] { /* private */ }
}
