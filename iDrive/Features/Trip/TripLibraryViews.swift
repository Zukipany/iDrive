// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Under the planner: the trips still ahead (planned here or said to Apple Intelligence) and
/// the ones already driven. Tapping one plans it with fresh prices and weather.
struct TripLibrarySections: View {
    let library: TripLibrary
    /// The trip on screen, left out of the lists.
    var excluding: SavedTrip.ID?
    /// The trip, and whether to plan it again from now (a previous trip).
    let open: (SavedTrip, _ again: Bool) -> Void

    var body: some View { /* private */ }
}

private struct SavedTripRow: View {
    let trip: SavedTrip
    let isPast: Bool

    /// "Tomorrow, 08:00", "14 Oct 2026, 16:22".
    private static let when: DateFormatter

    var body: some View { /* private */ }

    private var subtitle: String { /* private */ }

    private func summaryLine(_ summary: SavedTrip.Summary) -> String { /* private */ }
}
