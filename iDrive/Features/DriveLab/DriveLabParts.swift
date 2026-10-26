// Source code is private. This file shows only its types and signatures.

import CoreLocation
import SwiftUI

/// A drive's trace as a shape, fitted into the frame with the right proportions: a thumbnail
/// that tells drives apart at a glance.
nonisolated struct RouteShape: Shape {
    let points: [Ride.Point]

    func path(in rect: CGRect) -> Path { /* private */ }
}

/// The road mix as one bar: town, country roads, motorway. The words come alongside (not colour alone).
struct RoadMixBar: View {
    let city: Double
    let rural: Double
    let motorway: Double

    static let cityColor , ruralColor , motorwayColor

    var body: some View { /* private */ }

    private func segment(_ share: Double, _ color: Color, width: CGFloat) -> some View { /* private */ }

    private func percent(_ share: Double) -> String { /* private */ }
}

/// The bar's legend, with each share.
struct RoadMixLegend: View {
    let analysis: RideAnalysis

    var body: some View { /* private */ }

    private func item(_ title: String, _ share: Double, _ color: Color) -> some View { /* private */ }
}

/// A figure with its label, for the grids.
struct StatTile: View {
    let title: String
    let value: String
    let symbol: String

    var body: some View { /* private */ }
}

/// A Drive Lab card: a title, then content, on the grouped background.
struct LabCard<Content: View>: View {
    let title: String
    var symbol: String?
    @ViewBuilder let content: Content

    var body: some View { /* private */ }
}

/// What the engine thinks a drive used: its day's temperature where Open-Meteo has it, the
/// drive's roads and style where stage two has learned them.
struct DriveEstimate: Equatable {
    /// What it's based on.
    enum Basis: Equatable {
        /// The engine, with the drive's roads and style where stage two has learned them.
        case engine(withDriving: Bool)
        /// No model yet: the car's measured average or rated figure.
        case average
    }

    /// l or kWh per 100 km.
    let per100km: Double
    /// The day's mean temperature it used; nil when unknown (the model's comfort temperature then).
    let temperature: Double?
    let basis: Basis

    func amount(km: Double) -> Double { /* private */ }

    static func make(for analysis: RideAnalysis, temperature: Double?, report: EngineReport?) -> DriveEstimate? { /* private */ }
}

extension Ride.Recognition {
    /// "CarPlay", "Bluetooth" … for the Drive Lab.
    var title: String { /* private */ }

    var symbol: String { /* private */ }
}
