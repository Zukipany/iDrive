// Source code is private. This file shows only its types and signatures.

import Foundation

/// How good the engine's predictions are, measured the honest way: walk forward through the
/// log and predict each stretch from the stretches before it only, as if it were the next
/// fill-up. Every change to the engine has to beat the simple average here.
nonisolated extension ConsumptionEngine {
    struct Accuracy: Equatable, Sendable {
        /// Mean absolute error in percent: always guessing the average of earlier stretches.
        let naive: Double
        /// The same with the temperature model (stage one).
        let weather: Double
        /// With the driving model too (stage two), when rides cover the stretches.
        let driving: Double?
        /// Stretches predicted.
        let predicted: Int
    }

    /// Nil until there are stretches to predict (`minimumIntervals` + 1 with weather).
    static func backtest(
        _ intervals: [Interval],
        electric: Bool,
        driving: [Int: (Driving, Double)] = [:]
    ) -> Accuracy? { /* private */ }
}
