// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Observation

/// Current location via `CLLocationUpdate.liveUpdates()`.
///
/// `CLServiceSession` asks for When-In-Use permission the first time `start()` runs,
/// so permission is requested in context (when the map appears), not at launch.
@MainActor @Observable
final class LocationService {
    private(set) var location: CLLocation?
    private(set) var isDenied

    /// Ignore moves smaller than this so GPS jitter doesn't trigger new price requests.
    private let minimumMove: CLLocationDistance
    private var session: CLServiceSession?
    private var updates: Task<Void, Never>?

    func start() { /* private */ }

    /// The unit tests run inside the app; they must not trigger a permission prompt.
    private static let isRunningTests

    func stop() { /* private */ }
}
