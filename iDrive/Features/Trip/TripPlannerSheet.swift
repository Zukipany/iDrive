// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftUI

/// "Plan Trip": where to, when, and how the car starts. With a trip planned, its stops.
struct TripPlannerSheet: View {
    @Environment(\.dismiss) private var dismiss
    let model: TripViewModel
    let vehicle: Vehicle?
    let origin: CLLocationCoordinate2D?

    @State private var completer
    @State private var destination: MKMapItem?
    @State private var options

    var body: some View { /* private */ }

    private var form: some View { /* private */ }

    @ViewBuilder private var destinationSection: some View { /* private */ }

    /// A saved trip: planned again now with fresh prices and weather, from its own start or
    /// from here. A previous trip becomes a new one leaving now.
    private func open(_ saved: SavedTrip, again: Bool) { /* private */ }

    private func plan() { /* private */ }
}

/// How full the car is when leaving: estimated (1b) or read off the gauge.
private struct TripLevelPicker: View {
    let vehicle: Vehicle
    @Binding var options: TripOptions

    var body: some View { /* private */ }
}

/// Reserve, detour, cheapest or fewest stops, weather, and the electric car's needs (5, 6).
private struct TripPreferenceSection: View {
    let vehicle: Vehicle
    @Binding var options: TripOptions

    var body: some View { /* private */ }
}
