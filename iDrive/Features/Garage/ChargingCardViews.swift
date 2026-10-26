// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// The driver's charging plans in the Garage. Charger prices on the map use them where
/// they beat the ad-hoc price. Shown once there is an electric or plug-in car, or a plan.
struct ChargingCardsSection: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \ChargingCard.addedAt) private var cards: [ChargingCard]
    @Query private var vehicles: [Vehicle]
    @State private var showsPicker

    private var isRelevant: Bool { /* private */ }

    var body: some View { /* private */ }

    private func remove(_ card: ChargingCard) { /* private */ }
}

/// Add a common subscription with one tap, or set up any other plan.
struct ChargingPlanPicker: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var cards: [ChargingCard]

    var body: some View { /* private */ }

    /// Tapping adds the plan, or removes it again; a checkmark shows it's added.
    private func presetRow(_ preset: ChargingPlanPreset) -> some View { /* private */ }
}

/// A plan iDrive doesn't know: a name, the operators it's cheaper at, AC and DC prices,
/// and optionally one price for every other network.
struct CustomChargingPlanForm: View {
    let onSave: () -> Void

    @Environment(\.modelContext) private var context
    @State private var name
    @State private var operators: Set<String>
    @State private var ac: Double?
    @State private var dc: Double?
    @State private var elsewhere: Double?
    @State private var hasElsewhere

    private static let prices: ClosedRange<Double>

    private func isPrice(_ value: Double?) -> Bool { /* private */ }

    private var isValid: Bool { /* private */ }

    var body: some View { /* private */ }

    private func operatorRow(_ name: String) -> some View { /* private */ }

    private func save() { /* private */ }
}
