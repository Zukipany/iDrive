// Source code is private. This file shows only its types and signatures.

import CoreLocation
import MapKit
import SwiftUI

/// The primary action on a station or charger page. A control, so Liquid Glass is right here.
/// Shows Apple's driving time and road distance ("13 min · 6,8 km"); the straight-line
/// distance in the rows can be a third shorter than the drive.
struct DirectionsButton: View {
    let name: String
    let coordinate: CLLocationCoordinate2D
    let address: String?
    /// Straight-line km, shown only until the driving estimate arrives.
    let distanceKm: Double?

    @State private var estimate: Directions.Estimate?

    var body: some View { /* private */ }
}

/// Street-level preview, when Apple has Look Around imagery for the spot.
/// Loads on appear; the section is simply absent where there's no imagery.
struct LookAroundSection: View {
    let coordinate: CLLocationCoordinate2D
    @State private var scene: MKLookAroundScene?

    var body: some View { /* private */ }
}

/// "2 of 4 free" with a symbol, so it doesn't rely on colour.
struct AvailabilityLabel: View {
    let availability: ChargePoint.Availability

    var body: some View { /* private */ }
}

/// "1,3 km north-west" from the user, or the plain distance when the position is unknown.
func distanceDescription(
    km: Double?,
    to coordinate: CLLocationCoordinate2D,
    from origin: CLLocationCoordinate2D?
) -> String? { /* private */ }
