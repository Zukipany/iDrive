// Source code is private. This file shows only its types and signatures.

import SwiftUI

extension View {
    /// Runs `progress` from 0 to 1 when the card comes into view (the ring fills, bars
    /// grow, lines draw) and back to 0 when it leaves, so it plays each time you reach it.
    /// Reduce Motion shows the finished state straight away.
    func revealOnScroll(_ progress: Binding<Double>) -> some View { /* private */ }

    /// Draws a chart's plot from left to right as `progress` goes from 0 to 1.
    func drawsIn(_ progress: Double) -> some View { /* private */ }
}

struct RevealOnScroll: ViewModifier {
    @Binding var progress: Double
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var pending: Task<Void, Never>?

    func body(content: Content) -> some View { /* private */ }

    private func reveal() { /* private */ }

    private func reset() { /* private */ }
}

/// The ring's centre number, counting as it animates.
struct CountingEuros: View, Animatable {
    var value: Double

    nonisolated var animatableData: Double {
        get { /* private */ }
        set { /* private */ }
    }

    var body: some View { /* private */ }
}
