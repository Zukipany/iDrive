// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// Add or edit a car. Make and model are chosen in searchable pickers; models with typical
/// values fill in the specs, and Apple Intelligence suggests them for the rest. The VIN
/// fills in make, model and year and links to a history check.
/// Suggestions are never applied without a tap (HIG: Generative AI).
struct VehicleForm: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let vehicle: Vehicle?
    let isFirstVehicle: Bool

    @State private var draft
    /// The form as it was opened, to tell whether anything changed.
    @State private var initialSnapshot: VehicleDraft.Snapshot?
    @State private var confirmsDiscard

    private var hasChanges: Bool { /* private */ }

    var body: some View { /* private */ }

    private func save() { /* private */ }
}
