// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// The Apple Intelligence orb: a glow that turns while listening or answering and rests
/// otherwise (an always-moving orb would redraw 60 times a second and cost battery).
/// Still with Reduce Motion.
struct AssistantOrb: View {
    var size: CGFloat
    var isActive
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View { /* private */ }

    private func sphere(turn: Angle) -> some View { /* private */ }
}

/// The Ask tab: type or say a question; answers come from Apple Intelligence on the
/// iPhone, using a fact sheet about the active car. It's the tab bar's separate circle on
/// the right (a search-role tab), so it moves with the tab bar instead of covering content.
struct AssistantScreen: View {
    @Query(filter: #Predicate<Vehicle> { }) private var activeVehicles: [Vehicle]
    @Query private var vehicles: [Vehicle]
    @Query private var cards: [FuelCard]
    @Environment(LocationService.self) private var location

    @State private var chat
    @State private var speech
    @State private var question
    @FocusState private var isTyping: Bool

    private var suggestions: [String] { /* private */ }

    var body: some View { /* private */ }

    private var conversation: some View { /* private */ }

    private var welcome: some View { /* private */ }

    @ViewBuilder private func bubble(_ message: AssistantChat.Message) -> some View { /* private */ }

    private var inputBar: some View { /* private */ }

    private func send(_ text: String) { /* private */ }
}
