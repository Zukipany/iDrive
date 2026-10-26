// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftUI

struct ConsumptionCard: View {
    let vehicle: Vehicle

    @AppStorage("frontEnergyLayer") private var front: EnergyLayer
    @State private var progress

    private var isLayered: Bool { /* private */ }
    /// The energy the numbers describe: the front layer for a plug-in hybrid.
    private var shownLayer: EnergyLayer { /* private */ }

    /// Litres and kWh are measured separately, each from its own tank or battery.
    private func series(_ layer: EnergyLayer) -> [FuelMath.ConsumptionPoint] { /* private */ }

    private func range(_ layer: EnergyLayer, _ per100km: Double) -> String? { /* private */ }

    private func unit(_ layer: EnergyLayer) -> String { /* private */ }

    /// The series in the driver's unit (l/100 km, mpg …), for the charts.
    private func shown(_ series: [FuelMath.ConsumptionPoint], _ layer: EnergyLayer) -> [Double] { /* private */ }

    var body: some View { /* private */ }

    private func singleChart(_ series: [FuelMath.ConsumptionPoint]) -> some View { /* private */ }

    private struct ScaledPoint: Identifiable {
        let date: Date
        let value: Double
        var id: Date { /* private */ }
    }

    private func scaled(_ layer: EnergyLayer) -> [ScaledPoint] { /* private */ }

    /// l/100 km and kWh/100 km have different scales, so each line is scaled to fit and the
    /// axis labels belong to the front line.
    private var layeredChart: some View { /* private */ }

    private func kpi(_ title: LocalizedStringKey, _ value: String) -> some View { /* private */ }
}
