// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// Manual entry and receipt confirmation. Any two of amount / price / total
/// compute the third; values read from a receipt can always be edited.
struct FillUpForm: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Environment(LocationService.self) private var location

    let vehicle: Vehicle
    let draft: FillUpDraft
    /// Called with the new entry after it's saved.
    let onSave: (FillUp) -> Void

    @State private var date
    @State private var fuel: FuelType
    @State private var amount: Double?
    @State private var price: Double?
    @State private var total: Double?
    @State private var odometer: Int?
    @State private var isFullTank
    /// Level after a partial fill (0…1); nil while "Not sure".
    @State private var partialLevel: Double?
    @State private var stationName
    /// The two fields the user edited most recently; the third is computed.
    @State private var recentEdits: [FuelMath.Field]
    @State private var flagged: Set<FuelMath.Field>
    @State private var confirmsDiscard
    @State private var isAskingAI
    @State private var aiNote: String?
    /// The car's own reading (Smartcar) the odometer started with.
    @State private var prefilledOdometer: Int?

    /// Anything typed or scanned that Save would keep; the car's own odometer alone isn't.
    private var hasChanges: Bool { /* private */ }

    /// The readings the entries before and after the chosen date allow.
    private var bounds: FillUpRules.OdometerBounds { /* private */ }
    private var odometerIsValid: Bool { /* private */ }
    private var isValid: Bool { /* private */ }

    var body: some View { /* private */ }

    private var odometerSection: some View { /* private */ }

    @ViewBuilder private var receiptSection: some View { /* private */ }

    // MARK: Receipt

    /// A discount read from the receipt (Payback, coupon); the total is what was paid.
    private var discount: Double { /* private */ }

    @ViewBuilder private var receiptStatus: some View { /* private */ }

    // MARK: Amount / price / total

    private func field(_ title: LocalizedStringKey, _ field: FuelMath.Field) -> some View { /* private */ }

    private func value(_ field: FuelMath.Field) -> Double? { /* private */ }

    private func set(_ field: FuelMath.Field, _ newValue: Double?) { /* private */ }

    /// User edits go through this binding; computed values are set directly,
    /// so a recalculation never triggers another one.
    private func binding(_ field: FuelMath.Field) -> Binding<Double?> { /* private */ }

    /// Fills the flagged fields from the model's reading of the photo; they stay flagged, to check against the receipt.
    private func askAI() { /* private */ }

    // MARK: Tank level and consumption

    private var capacity: Double? { /* private */ }
    private var layer: EnergyLayer { /* private */ }
    private var previousEntries: [FillUp] { /* private */ }

    /// Gauge eighths for fuel; 10 % steps for a battery, as the car shows them.
    private var levelChoices: [Double] { /* private */ }

    private var levelPicker: some View { /* private */ }

    /// Where the gauge should be now, from the last known level and the average use.
    private var estimatedLevel: Double? { /* private */ }

    /// What this fill-up says about the car, live while typing.
    private var insight: ConsumptionPreview.Insight? { /* private */ }

    // MARK: Lifecycle

    private func prefill() { /* private */ }

    private func save() { /* private */ }
}
