// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

struct GarageScreen: View {
    @Environment(\.modelContext) private var context
    @Query(sort: [SortDescriptor(\Vehicle.sortIndex), SortDescriptor(\Vehicle.createdAt)]) private var vehicles: [Vehicle]

    @State private var editor: VehicleEditor?
    @State private var pendingDelete: Vehicle?
    @State private var errorMessage: String?
    @State private var showsDeveloper
    @State private var showsSettings
    @AppStorage(RideRecorder.enabledKey) private var learnsFromDrives
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View { /* private */ }

    private var list: some View { /* private */ }

    private func perform(_ action: () throws -> Void) { /* private */ }
}

#if DEBUG
    extension GarageScreen {
        /// Adds a demo car with 6 months of realistic fill-ups and makes it active, to review
        /// the charts. Debug builds only.
        fileprivate var demoMenu: some View { /* private */ }
    }
#endif

/// Which vehicle the form edits; nil means a new one.
enum VehicleEditor: Identifiable {
    case new
    case edit(Vehicle)

    var id: String { /* private */ }

    var vehicle: Vehicle? { /* private */ }
}
