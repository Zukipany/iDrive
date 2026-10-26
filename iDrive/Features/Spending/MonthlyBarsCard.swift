// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftUI

struct MonthlyBarsCard: View {
    let vehicle: Vehicle

    /// Shared with the consumption card, so both show the same energy in front.
    @AppStorage("frontEnergyLayer") private var front: EnergyLayer
    @State private var selectedDate: Date?
    @State private var progress

    private struct Month: Identifiable {
        let period: Date
        var fuel
        var electric
        var id: Date { /* private */ }
        var total: Double { /* private */ }
        func value(_ layer: EnergyLayer) -> Double { /* private */ }
    }

    /// A plug-in hybrid gets fuel and charging as two layered bars per month.
    private var isLayered: Bool { /* private */ }

    /// The last 6 months with spending, split by energy.
    private var months: [Month] { /* private */ }

    var body: some View { /* private */ }

    private func caption(selected: Month?, average: Double) -> String { /* private */ }
}
