// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Typical values for a catalogue model, or Apple Intelligence's suggestion for any other
/// car. Never applied without a tap (HIG: Generative AI). After one is used the section
/// closes, and it comes back only for a different make, model or year.
struct SuggestionSection: View {
    @Bindable var draft: VehicleDraft
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    /// Apple Intelligence's answer for one car (`key` is the draft's suggestion key).
    private struct Answer {
        let key: String
        let specs: CarAssistant.Specs?
        let error: String?
    }

    @State private var answer: Answer?
    @State private var isAsking
    /// The suggestion being filled in: its row shimmers for a moment first.
    @State private var applying: String?

    /// The answer, if it's for the car currently in the form.
    private var currentAnswer: Answer? { /* private */ }

    var body: some View { /* private */ }

    @ViewBuilder private var intelligenceRows: some View { /* private */ }

    /// A suggestion with "Use". Tapping it shimmers the row while the values fill in.
    private func suggestionRow(
        id: String,
        apply: @escaping () -> Void,
        @ViewBuilder label: () -> some View
    ) -> some View { /* private */ }

    private func use(_ id: String, apply: @escaping () -> Void) { /* private */ }

    private func ask() { /* private */ }

    /// "SUV · Petrol"
    private func kindSummary(_ specs: CarAssistant.Specs) -> String { /* private */ }

    /// "65 l · 7,8 l/100 km"
    private func figuresSummary(_ specs: CarAssistant.Specs) -> String { /* private */ }

    private func energyLabel(_ energy: CarAssistant.Energy) -> String { /* private */ }
}
