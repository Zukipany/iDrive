// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// The planned trip: what's happening, any warnings, the stops in order and the hand-off.
struct TripPlanView: View {
    let model: TripViewModel
    let vehicle: Vehicle?
    /// Opens another saved trip from the lists under the plan.
    var openSaved: (SavedTrip, _ again: Bool) -> Void

    @Environment(\.openURL) private var openURL
    @State private var confirmsEnd
    @State private var fillUpFor: Trip.Stop?
    /// A station tapped on the trip map, to choose instead of a planned stop.
    @State private var choosing: Trip.Candidate?
    private var connectivity

    init(model: TripViewModel, vehicle: Vehicle?, openSaved: @escaping (SavedTrip, _ again: Bool) -> Void = { _, _ in }) { /* private */ }

    var body: some View { /* private */ }

    private var isSearching: Bool { /* private */ }

    @ViewBuilder private var statusSection: some View { /* private */ }

    private func destinationRow(_ trip: ActiveTrip) -> some View { /* private */ }
}

extension FillUpDraft {
    /// A fill-up at a trip stop: station, fuel and the price the plan expected (9c).
    init(stop: Trip.Stop, fuel: FuelType?) { /* private */ }
}
