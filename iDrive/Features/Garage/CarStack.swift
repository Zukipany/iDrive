// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// The Garage's cars as a stack of passes, as in Wallet: the active car is in front and shown
/// whole, the others show their top strip behind it. Tapping one brings it to the front.
/// Swiping the front card left shows Edit and Delete, as on a list row; a long swipe deletes.
struct CarStack: View {
    /// In Garage order (`sortIndex`); the main car first.
    let vehicles: [Vehicle]
    let onActivate: (Vehicle) -> Void
    let onEdit: (Vehicle) -> Void
    let onMakeMain: (Vehicle) -> Void
    let onDelete: (Vehicle) -> Void

    @ScaledMetric(relativeTo: .title3) private var stripHeight
    /// At large text sizes the card grows beyond the bank-card shape so nothing is cut off.
    @ScaledMetric(relativeTo: .title3) private var minimumCardHeight

    /// How far the front card is pushed left; `-revealWidth` while its actions are open.
    @State private var swipeOffset
    /// Decided on a drag's first move, so a scroll that drifts sideways doesn't swipe.
    @State private var isHorizontalDrag
    /// `swipeOffset` when the drag began: 0 closed, `-revealWidth` open.
    @State private var dragStart
    /// Where the current drag began. A drag the list takes over for scrolling ends without
    /// `onEnded`, so a new start point is what tells a new drag apart.
    @State private var dragOrigin: CGPoint?
    /// False again as soon as a drag ends or is cancelled.
    @GestureState private var isDragging
    /// When a sideways drag last moved. Lifting the finger also taps the card's button, and
    /// that tap mustn't close the actions the drag just opened.
    @State private var lastSwipeMove
    private let actionWidth
    private var revealWidth: Double { /* private */ }
    /// Past this, letting go deletes, like a full swipe on a list row. Beyond the actions the
    /// card resists (`resisted`), so this takes a long, deliberate swipe.
    private let deleteDistance

    /// The cars behind in Garage order, then the active one in front.
    private var stacked: [Vehicle] { /* private */ }

    var body: some View { /* private */ }

    private func pass(_ car: Vehicle) -> some View { /* private */ }

    /// Edit and Delete, uncovered as the front card slides left.
    private func swipeActions(_ car: Vehicle) -> some View { /* private */ }

    private func swipeButton(_ title: LocalizedStringKey, symbol: String, color: Color, action: @escaping () -> Void) -> some View { /* private */ }

    private func swipe(_ car: Vehicle) -> some Gesture { /* private */ }

    /// Follows the finger up to the actions' width, then a third as fast.
    private func resisted(_ offset: Double) -> Double { /* private */ }

    private func closeSwipe() { /* private */ }

    private func accessibilityLabel(_ car: Vehicle) -> String { /* private */ }
}

/// Places cards on top of each other, each one strip lower than the one before; later
/// cards cover earlier ones, so the last is the one in front. Moving a car to the end
/// inside `withAnimation` slides it down to the front.
struct PassStackLayout: Layout {
    let stripHeight: Double
    let minimumCardHeight: Double
    /// Width : height of a bank card (ISO/IEC 7810 ID-1).
    private let cardRatio

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize { /* private */ }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) { /* private */ }

    private func cardHeight(_ width: Double) -> Double { /* private */ }
}

/// Pressing a card sinks it a little, like pressing a pass in Wallet.
private struct PassButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View { /* private */ }
}
