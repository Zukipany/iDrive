// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftUI

/// The controls over the map, in two rows:
///
///     [‹] [E5] [AC] [DC] [+ 3]             fuel chips
///     (route)                    (location)
///
/// The trip button mirrors the location button on the other side. When the chips leave
/// room (a petrol, diesel or electric car's row: "‹ AC DC + 4"), the location button moves up
/// into their row's corner; it drops to the second row only for all fuels or a plug-in hybrid.
/// Collapsing the chips removes their row, and the button row slides up into it with the
/// summary chip between the two buttons, so no empty row stays behind:
///
///     (route)      [E5 + AC + DC ›]      (location)
struct MapTopBar: View {
    @Binding var selected: Set<FuelType>
    let carFuels: [FuelType]
    /// The chips offered here; see `FuelFilterBar.available`.
    let available: [FuelType]
    @Binding var mode: FuelFilterBar.Mode
    /// The map's scope, so the compass controls it from here.
    let mapScope: Namespace.ID
    let trip: TripViewModel
    let openTrip: () -> Void
    let openRoute: () -> Void
    /// Shows the user, then their heading, then north up again (`LocateCycle`).
    let locateButton: LocateButton

    @State private var chipsWidth: CGFloat
    @State private var barWidth: CGFloat
    /// The chips' row, so the location button knows where the second row starts.
    @State private var chipRowHeight: CGFloat
    /// The bar's height with the chips out. It stays reserved when they collapse: the map's
    /// top safe area must not change, or MapKit re-lays out and leaves the strip white for a
    /// few frames (the "white spot" while switching).
    @State private var expandedHeight: CGFloat

    /// Room in the chips' row for the location button: chips, margins, a gap and the button.
    private var locationInChipRow: Bool { /* private */ }

    /// Where the one location button sits: the chips' row, the second row, or (chips
    /// collapsed) the first. One view that moves, never two crossfading: glass that fades
    /// shows as a pale blob.
    private var locationOffset: CGFloat { /* private */ }

    var body: some View { /* private */ }

    /// Keeps the location button's place in a row; the button itself is drawn on top.
    private var buttonSpace: some View { /* private */ }

    private var locationControls: some View { /* private */ }
}

/// The trip planner's button: plans a trip, or opens the one on. Apple Maps is opened from
/// the plan only, with one button, so there's a single way out of the app.
struct TripCircleButton: View {
    let trip: TripViewModel
    let open: () -> Void
    let openRoute: () -> Void

    var body: some View { /* private */ }

    private var accessibilityText: String { /* private */ }
}
