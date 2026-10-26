// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftUI

/// A plug-in hybrid's driving, instead of separate l/100 km and kWh/100 km (which mean
/// little when the car mixes both): how much ran on electricity, what petrol it uses when
/// on petrol, what each km costs, and what charging saved. All estimated from the km, kWh
/// and litres logged; see `HybridMix`.
struct HybridCard: View {
    let vehicle: Vehicle

    enum Period: Hashable { case month, sixMonths }
    @State private var period: Period
    @State private var progress

    private var electric: Double { /* private */ }

    private var mix: HybridMix? { /* private */ }

    var body: some View { /* private */ }

    /// Electric and petrol km per month, stacked.
    @ViewBuilder private var monthlyChart: some View { /* private */ }

    private func kpi(_ title: LocalizedStringKey, _ value: String) -> some View { /* private */ }
}

/// The electric share as a bar: electric from the left, petrol for the rest. The labels
/// beside it say the same in words (not colour alone).
private struct MixBar: View {
    let share: Double

    var body: some View { /* private */ }
}

extension Vehicle {
    /// kWh/100 km when a plug-in hybrid drives on electricity: its own figure, else a typical one.
    var hybridElectricConsumption: Double { /* private */ }
}
