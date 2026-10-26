// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftUI

struct BalanceCard: View {
    let summary: SpendingSummary
    let budget: Double
    /// What the month's fill-ups saved against the average nearby; nil without data.
    let savings: Savings?
    @Binding var monthOffset: Int

    @ScaledMetric(relativeTo: .largeTitle) private var ringSize
    @State private var progress

    private var previousMonthName: String { /* private */ }

    var body: some View { /* private */ }

    /// Spending per fuel, and how many fill-ups.
    @ViewBuilder private var energyBreakdown: some View { /* private */ }

    @ViewBuilder private var changeLabel: some View { /* private */ }

    private var monthHeader: some View { /* private */ }

    private func sliceLabel(_ slice: SpendingSummary.Slice) -> some View { /* private */ }
}
