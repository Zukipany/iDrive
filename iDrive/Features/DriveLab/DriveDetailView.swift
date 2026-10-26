// Source code is private. This file shows only its types and signatures.

import Charts
import MapKit
import SwiftUI

/// One drive: the route coloured by speed (town, country roads, motorway), its figures, speed
/// over time, and what the engine makes of it.
struct DriveDetailView: View {
    let ride: Ride
    /// The day's mean temperature, when Open-Meteo has it.
    let temperature: Double?
    let report: EngineReport?

    @Environment(\.dismiss) private var dismiss
    @State private var confirmsDelete

    var body: some View { /* private */ }

    private func figures(_ analysis: RideAnalysis) -> some View { /* private */ }

    @ViewBuilder private func engine(_ analysis: RideAnalysis) -> some View { /* private */ }

    private func estimateNote(_ estimate: DriveEstimate, price: Double?, amount: Double) -> String { /* private */ }

    private var car: some View { /* private */ }
}

/// The route in pieces, each coloured by its speed band, with start and end flags.
private struct RouteMap: View {
    let points: [Ride.Point]

    /// Consecutive points of one band, overlapping by a point so the line has no gaps.
    private var pieces: [(color: Color, coordinates: [CLLocationCoordinate2D])] { /* private */ }

    private func band(_ kmh: Double) -> Color { /* private */ }

    var body: some View { /* private */ }
}

/// Speed over the drive, with the town and motorway limits of the road bands.
private struct SpeedChart: View {
    let points: [Ride.Point]

    var body: some View { /* private */ }
}
