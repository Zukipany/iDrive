// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Every fill-up, newest first, at the bottom of the ring's card. It opens and closes;
/// open, it scrolls on its own, and the month being read moves the ring above to that month.
struct LogBox: View {
    let months: [(month: Date, items: [FillUp])]
    /// Fills the screen under the ring, so the ring stays in view while the log scrolls.
    let height: CGFloat
    /// The month the ring shows; the box scrolls there when the ring's arrows change it.
    let shownMonth: Date
    let onMonthChange: (Date) -> Void
    let onDelete: (FillUp) -> Void

    @AppStorage("logIsOpen") private var isOpen
    @State private var tracker
    /// Asked before deleting: a fill-up is money spent, and a slip of the finger on the
    /// menu shouldn't remove it.
    @State private var pendingDelete: FillUp?

    private var count: Int { /* private */ }

    var body: some View { /* private */ }

    private var header: some View { /* private */ }

    private func monthHeader(_ month: Date, items: [FillUp]) -> some View { /* private */ }

    @ViewBuilder private func rows(_ items: [FillUp]) -> some View { /* private */ }

    /// The month whose header has reached the top of the box goes to the ring.
    private func report() { /* private */ }
}

/// Where each month's header sits in the log box while scrolling. A plain class on
/// purpose: it changes on every scroll frame, which mustn't redraw the screen.
final class LogScrollTracker {
    var tops: [Date: CGFloat]
    /// The month last handed to the ring.
    var reported: Date?

    /// The month whose header has reached `line`: the lowest header above it.
    func month(at line: CGFloat) -> Date? { /* private */ }
}
