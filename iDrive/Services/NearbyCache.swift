// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// Caches API results by place. A lookup within `matchDistance` of a stored search
/// point reuses that result, so GPS jitter never causes a new request. (Rounding
/// coordinates to a grid doesn't work: two points 50 m apart can sit on either side
/// of a grid line.)
nonisolated struct NearbyCache<Value: Sendable>: Sendable {
    struct Entry: Sendable {
        let latitude: Double
        let longitude: Double
        let radiusKm: Double
        let date: Date
        let value: Value

        func distance(to coordinate: CLLocationCoordinate2D) -> CLLocationDistance { /* private */ }
    }

    var matchDistance: CLLocationDistance
    var capacity
    private(set) var entries: [Entry]

    /// The newest entry for the same radius near `coordinate`, however old.
    func entry(near coordinate: CLLocationCoordinate2D, radiusKm: Double) -> Entry? { /* private */ }

    var newest: Entry? { /* private */ }

    mutating func store(_ value: Value, at coordinate: CLLocationCoordinate2D, radiusKm: Double, date: Date) { /* private */ }
}
