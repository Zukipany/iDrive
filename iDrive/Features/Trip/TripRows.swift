// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// One stop: when, where, how much, and what to watch out for.
struct TripStopRow: View {
    let stop: Trip.Stop
    let isNext: Bool
    let isElectric: Bool
    let logFillUp: () -> Void
    let markDone: () -> Void

    var body: some View { /* private */ }

    private var detour: String { /* private */ }

    private var amountLine: String { /* private */ }

    static func text(for note: Trip.StopNote) -> String { /* private */ }

    static func symbol(for note: Trip.StopNote) -> String { /* private */ }
}

/// Lets a row use bordered or prominent buttons depending on whether it's the next stop.
struct AnyPrimitiveButtonStyle: PrimitiveButtonStyle {
    private let make: (Configuration) -> AnyView

    init(_ style: some PrimitiveButtonStyle) { /* private */ }

    func makeBody(configuration: Configuration) -> some View { /* private */ }
}

/// Things that stop the trip or need a decision first (1a, 1b, 2a, 3a).
struct TripWarningsSection: View {
    let warnings: [Trip.Warning]

    var body: some View { /* private */ }

    private func text(_ warning: Trip.Warning) -> String { /* private */ }

    private func symbol(_ warning: Trip.Warning) -> String { /* private */ }
}

/// Distance, time, cost range and the consumption the plan used (4a, 5).
struct TripSummarySection: View {
    let trip: ActiveTrip
    let figure: TripConsumption.Figure?

    var body: some View { /* private */ }

    /// "4 °C", or °F where the region uses it.
    static func temperature(_ celsius: Double) -> String { /* private */ }

    private func consumptionLine(_ figure: TripConsumption.Figure, electric: Bool) -> String { /* private */ }
}
