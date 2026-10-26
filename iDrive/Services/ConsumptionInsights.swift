// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import Observation

/// Runs the consumption engine for a car: its measured stretches, the weather they were
/// driven in, the fitted model and the seasons. Cached until the car's log changes.
@MainActor @Observable
final class ConsumptionInsights {
    static let shared

    struct Result: Equatable {
        let intervals: [ConsumptionEngine.Interval]
        let model: ConsumptionEngine.Model?
        let seasons: [ConsumptionEngine.SeasonFigure]
        let electric: Bool
        /// Plug-in hybrids: the share of km on electricity per month, with its temperature.
        let electricShares: [(month: Date, share: Double, temperature: Double?)]
        /// Why there's no model yet, for the card.
        let missing: Missing?

        static func == (lhs: Result, rhs: Result) -> Bool { /* private */ }
    }

    enum Missing: Equatable {
        /// Not enough measured stretches yet.
        case fewStretches(have: Int)
        /// No idea where the car is driven: open the map once.
        case noArea
    }

    private(set) var results: [String: Result]
    private let history: WeatherHistory

    init(history: WeatherHistory = .shared) { /* private */ }

    static func key(_ vehicle: Vehicle, _ layer: EnergyLayer) -> String { /* private */ }

    func result(for vehicle: Vehicle, layer: EnergyLayer) -> Result? { /* private */ }

    /// Builds (or reuses) the car's result for one energy.
    @discardableResult
    func update(for vehicle: Vehicle, layer: EnergyLayer) async -> Result { /* private */ }

    private func store(_ result: Result, _ key: String) -> Result { /* private */ }
}
