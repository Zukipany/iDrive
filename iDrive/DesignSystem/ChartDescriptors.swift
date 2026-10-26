// Source code is private. This file shows only its types and signatures.

import Accessibility
import SwiftUI
import Foundation

/// Describes the monthly spending bars to VoiceOver, so its Audio Graph can play and
/// summarise them (Accessibility > VoiceOver > Audio Graphs).
struct MonthlySpendingDescriptor: AXChartDescriptorRepresentable {
    let months: [(period: Date, total: Double)]

    func makeChartDescriptor() -> AXChartDescriptor { /* private */ }

    private var summary: String? { /* private */ }
}

/// Describes the consumption line to VoiceOver.
struct ConsumptionDescriptor: AXChartDescriptorRepresentable {
    let points: [(date: Date, value: Double)]
    /// "l/100 km" or "kWh/100 km".
    let unit: String

    func makeChartDescriptor() -> AXChartDescriptor { /* private */ }
}
