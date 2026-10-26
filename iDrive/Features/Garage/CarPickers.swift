// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Make picker: searchable list, popular makes first, any name can be typed in.
struct CarMakePicker: View {
    @Binding var make: String
    let onPick: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var search
    private let catalog

    private var results: [String] { /* private */ }
    private var typed: String { /* private */ }

    var body: some View { /* private */ }

    private func row(_ name: String) -> some View { /* private */ }

    private var customRow: some View { /* private */ }

    private func pick(_ name: String) { /* private */ }
}

/// Model picker for one make: generations with typical values first (they fill in the
/// specs), then every model name. Any name can be typed in.
struct CarModelPicker: View {
    let make: String
    @Binding var model: String
    @Binding var generationID: String?
    @Binding var year: Int?

    @Environment(\.dismiss) private var dismiss
    @State private var search
    private let catalog

    private var models: [String] { /* private */ }
    private var generations: [CarCatalog.Car] { /* private */ }
    private var typed: String { /* private */ }

    var body: some View { /* private */ }

    private func pick(_ car: CarCatalog.Car) { /* private */ }

    private func pick(_ name: String) { /* private */ }
}
