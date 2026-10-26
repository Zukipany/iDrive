// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftUI

/// Everything the engine knows about one car, built for the Drive Lab.
struct EngineReport {
    /// `Vehicle.reminderID`: drives of other cars aren't estimated with this model.
    let carID: String
    let carName: String
    let electric: Bool
    let result: ConsumptionInsights.Result
    let driving: ConsumptionEngine.DrivingModel?
    let coverage: [Int: (ConsumptionEngine.Driving, Double)]
    let accuracy: ConsumptionEngine.Accuracy?
    /// Until there's a model: the car's measured average (a plug-in hybrid's petrol use while
    /// on petrol), else its rated figure, for the drives' estimates.
    let fallbackPer100km: Double?

    @MainActor
    static func make(for car: Vehicle, rides: [(start: Date, km: Double, analysis: RideAnalysis)]) async -> EngineReport { /* private */ }

    @MainActor
    private static func fallback(for car: Vehicle, layer: EnergyLayer) -> Double? { /* private */ }
}

/// The engine for the active car: how cold costs it (the learned curve over the measured
/// stretches), how far off it is, and what the roads and driving style add.
struct EngineCard: View {
    let report: EngineReport
    @State private var showsStretches

    var body: some View { /* private */ }

    /// Consumption against the day's temperature: each stretch a dot, the learned model a line.
    private func curve(_ model: ConsumptionEngine.Model) -> some View { /* private */ }

    private func figures(_ model: ConsumptionEngine.Model) -> some View { /* private */ }

    private var missingText: String { /* private */ }
}

/// Walk-forward error of each stage, as bars: shorter is better.
private struct AccuracyBars: View {
    let accuracy: ConsumptionEngine.Accuracy

    var body: some View { /* private */ }
}

/// What each driving feature adds against the driver's usual mix, learned from the drives.
private struct EffectBars: View {
    let model: ConsumptionEngine.DrivingModel
    let electric: Bool

    var body: some View { /* private */ }
}

private struct IntervalRow: View {
    let interval: ConsumptionEngine.Interval
    let coverage: Double?
    let model: ConsumptionEngine.Model?
    let electric: Bool

    var body: some View { /* private */ }

    private var details: String { /* private */ }
}
