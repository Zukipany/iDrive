// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftUI

/// The trip on a map inside the plan: the route, the planned stops (numbered) and every other
/// priced station along it, cheaper ones green. Tapping a station shows what filling up
/// there would mean for the tank and the trip, and lets the driver choose it.
struct TripRouteMap: View {
    let trip: ActiveTrip
    let choose: (Trip.Candidate) -> Void

    /// At most this many other stations: the cheapest per 10 km of route.
    static let maxAlternatives

    private var stops: [Trip.Stop] { /* private */ }

    private var alternatives: [Trip.Candidate] { /* private */ }

    /// The planned stops' average price: alternatives below it are green.
    private var reference: Double? { /* private */ }

    var body: some View { /* private */ }

    /// A planned stop: its number on blue. Another station: its price, green when cheaper.
    private func price(_ candidate: Trip.Candidate, planned number: Int?) -> some View { /* private */ }
}

/// What choosing another station means: the fill there and the trip's new total.
struct StationChoiceSheet: View {
    @Environment(\.dismiss) private var dismiss
    let candidate: Trip.Candidate
    let current: Trip.Plan
    let trial: (plan: Trip.Plan, replaced: Trip.Stop?)?
    let isElectric: Bool
    let use: (Trip.Plan) -> Void

    private var stop: Trip.Stop? { /* private */ }

    var body: some View { /* private */ }

    /// "≈ 21,85 € (+0,80 €)".
    private func difference(_ plan: Trip.Plan) -> String { /* private */ }
}
