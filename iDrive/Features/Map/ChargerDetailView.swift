// Source code is private. This file shows only its types and signatures.

import CoreLocation
import SwiftUI

/// A charging site: ad-hoc price, live availability, connectors, what a 20–80 % charge
/// costs for the active car, and directions in Apple Maps.
struct ChargerDetailView: View {
    let charger: ChargePoint
    let origin: CLLocationCoordinate2D?
    let batteryKWh: Double?

    private var address: String? { /* private */ }

    var body: some View { /* private */ }

    private var connectorsSection: some View { /* private */ }

    private var priceSection: some View { /* private */ }

    private var placeSection: some View { /* private */ }
}

private extension String {
    var nilIfEmpty: String? { /* private */ }
}
