// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// The TÜV row of the car form: due month (as on the sticker), reminders, and what the
/// inspection is, costs and what being late means.
struct InspectionDetailView: View {
    @Bindable var draft: VehicleDraft
    private let calendar

    private var dueParts: (month: Int, year: Int)? { /* private */ }

    var body: some View { /* private */ }

    private var checks: [String] { /* private */ }

    @ViewBuilder private var dueSection: some View { /* private */ }

    @ViewBuilder private func status(for due: Date) -> some View { /* private */ }

    private var reminderBinding: Binding<Bool> { /* private */ }

    private var monthBinding: Binding<Int> { /* private */ }

    private var yearBinding: Binding<Int> { /* private */ }
}

/// The round HU sticker: the year's colour, the year in the middle and the due month
/// turned to the top, like on the number plate.
struct InspectionSticker: View {
    let month: Int
    let year: Int

    private var fill: Color { /* private */ }

    var body: some View { /* private */ }
}

/// The Service row of the car form: when it's due, and what a service involves.
struct ServiceDetailView: View {
    @Bindable var draft: VehicleDraft

    var body: some View { /* private */ }
}
