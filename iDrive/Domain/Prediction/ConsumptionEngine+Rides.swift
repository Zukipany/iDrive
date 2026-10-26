// Source code is private. This file shows only its types and signatures.

import Foundation

/// The engine's second stage: what the roads and the driving add, learned from recorded rides.
///
/// Stage one (`fit`) explains each measured stretch by its temperature. Where recorded rides
/// cover a stretch, its leftover (measured minus stage one) is explained by how it was
/// driven: motorway share, city share, harsh accelerations and brakings, and climbing, each
/// compared with the driver's usual mix. Every effect starts at what typical cars show and
/// moves towards the driver's own numbers as covered stretches come in.
nonisolated extension ConsumptionEngine {
    /// The ride features of a stretch (or a trip), km-weighted.
    struct Driving: Codable, Equatable, Sendable {
        var motorwayShare: Double
        var cityShare: Double
        var harshPer100km: Double
        var climbPer100km: Double

        /// A typical mix before any ride is recorded.
        static let typical

        var values: [Double] { /* private */ }
    }

    /// A stretch counts as covered when rides recorded this share of its km.
    static let coverageNeeded

    /// What typical cars use more, as a share of their base, per unit of each feature:
    /// all-motorway +20 % (electric +35 %), all-city +15 % (electric ±0: it recuperates),
    /// 10 harsh events per 100 km +5 %, 1,000 m climbed per 100 km +10 % (electric +5 %).
    static func typicalEffects(electric: Bool) -> [Double] { /* private */ }

    /// How sure the typical effects are: their usual spread across drivers' stretches.
    static let featureSpread

    struct DrivingModel: Codable, Equatable, Sendable {
        /// Stage one: temperature.
        let weather: Model
        /// Extra l or kWh per 100 km per unit of each `Driving` value, against `usual`.
        let effects: [Double]
        /// The driver's usual mix (the covered stretches' mean, or `Driving.typical`).
        let usual: Driving
        /// Covered stretches the effects were learned from.
        let coveredIntervals: Int
        /// 0…1 per effect: how much is learned rather than typical.
        let learnedShares: [Double]

        func predict(temperature: Double, driving: Driving) -> Double { /* private */ }
    }

    /// The stretches' driving from the rides inside them: (stretch index, driving, coverage).
    static func driving(for intervals: [Interval], rides: [(start: Date, km: Double, analysis: RideAnalysis)]) -> [Int: (Driving, Double)] { /* private */ }

    /// Stage two on top of `weather`. Works without any covered stretch (typical effects).
    static func fitDriving(
        _ intervals: [Interval],
        weather: Model,
        driving: [Int: (Driving, Double)],
        electric: Bool
    ) -> DrivingModel { /* private */ }

    /// Gaussian elimination with partial pivoting; nil for a singular system.
    static func solve(_ matrix: [[Double]], _ vector: [Double]) -> [Double]? { /* private */ }

    /// A route's driving from its average speed (Apple's route has no speed per road):
    /// fast averages mean motorway, slow ones town.
    static func routeDriving(averageKmh: Double, usual: Driving) -> Driving { /* private */ }
}
