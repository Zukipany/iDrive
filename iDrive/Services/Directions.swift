// Source code is private. This file shows only its types and signatures.

import CoreLocation
import MapKit

/// Hands navigation off to Apple Maps. iDrive never navigates itself (plan: US-13).
enum Directions {
    /// A map item that shows the station's own name in Apple Maps, not just coordinates.
    /// Uses `MKMapItem(location:address:)`; `MKPlacemark` is deprecated since iOS 26.
    static func mapItem(name: String, coordinate: CLLocationCoordinate2D, address: String?) -> MKMapItem { /* private */ }

    struct Estimate: Equatable, Sendable {
        let travelTime: TimeInterval
        let meters: CLLocationDistance

        /// "13 min" or "1 h 5 min".
        var travelTimeText: String { /* private */ }
        var distanceText: String { /* private */ }
    }

    /// Driving time and road distance from the current location, from Apple's routing
    /// service. Nil when there's no route or no network; the button then falls back to
    /// the straight-line distance.
    @MainActor
    static func drivingEstimate(to coordinate: CLLocationCoordinate2D) async -> Estimate? { /* private */ }

    /// Apple Maps allows this many stops in one link; more are left out (rare on one trip).
    static let maxWaypoints

    /// The whole trip in Apple Maps (9a): from where the driver is, through every stop still
    /// ahead, to the destination. iOS 18.4's directions link takes repeatable waypoints;
    /// coordinates, not names, so Apple Maps routes to the exact station, offline too (8b).
    static func routeURL(stops: [CLLocationCoordinate2D], destination: CLLocationCoordinate2D) -> URL { /* private */ }

    /// Opens Apple Maps with driving directions from the current location.
    @MainActor
    static func openInAppleMaps(name: String, coordinate: CLLocationCoordinate2D, address: String?) { /* private */ }
}
