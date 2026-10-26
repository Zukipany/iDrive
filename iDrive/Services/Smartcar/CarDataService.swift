// Source code is private. This file shows only its types and signatures.

import Foundation
import Observation

/// The cars linked to their maker's connected-car account through Smartcar, and what each
/// last reported (odometer, tank, range). Kept on the iPhone: the links in UserDefaults, the
/// readings in `car-readings.json`. Asks the car at most every `minimumInterval` by itself,
/// since a Smartcar plan allows a few hundred requests per car and month.
@MainActor @Observable
final class CarDataService {
    static let shared

    /// One Garage car linked to one Smartcar vehicle.
    nonisolated struct Link: Codable, Equatable, Sendable {
        /// Smartcar's id for the owner: the `sc-user-id` of every request.
        let userID: String
        let vehicleID: String
        /// "BMW X5 2024", as the maker's account names it.
        let title: String
        let linkedAt: Date
    }

    /// Asked by itself at most this often (a pull asks at once).
    static let minimumInterval: TimeInterval
    private static let linksKey

    private(set) var links: [String: Link]
    private(set) var readings: [String: CarReading]
    private(set) var refreshing: Set<String>
    /// The last failure per car, shown under its figures.
    private(set) var problems: [String: String]

    @ObservationIgnored private let defaults: UserDefaults
    @ObservationIgnored private let file: URL?
    @ObservationIgnored private let makeBackend: () -> (any SmartcarBackend)?

    init(
        defaults: UserDefaults = .standard,
        file: URL? = CarDataService.defaultFile,
        backend: @escaping () -> (any SmartcarBackend)? = CarDataService.configuredBackend
    ) { /* private */ }

    nonisolated static var defaultFile: URL? { /* private */ }

    // MARK: Configuration

    /// The app's UUID (public; in the Dashboard's address bar and Application details): Connect
    /// and the redirect use it.
    nonisolated static var applicationID: String { /* private */ }

    /// The `client_…` ID of the token flow (public; Configuration → API credentials).
    nonisolated static var clientID: String { /* private */ }

    nonisolated static var mode: SmartcarAPI.Mode { /* private */ }

    /// The proxy when one is set (it holds the secret); in debug builds otherwise Smartcar itself.
    nonisolated static func configuredBackend() -> (any SmartcarBackend)? { /* private */ }

    /// Debug builds with `-smartcarDemo YES`: a made-up car instead of Smartcar, to try the screens.
    nonisolated static var isDemo: Bool { /* private */ }

    /// True when Connect can be opened and the data read afterwards.
    var isConfigured: Bool { /* private */ }

    // MARK: Cars

    func link(for vehicle: Vehicle) -> Link? { /* private */ }

    func reading(for vehicle: Vehicle) -> CarReading? { /* private */ }

    /// A fresh reading (under a day old) for prefilling and planning.
    func freshReading(for vehicle: Vehicle, now: Date = .now) -> CarReading? { /* private */ }

    /// The odometer to prefill a fill-up with: the car's own fresh reading, when it's past the
    /// entry before.
    func suggestedOdometer(for vehicle: Vehicle, after lower: Int?) -> Int? { /* private */ }

    /// The owner's cars after Connect: one is linked at once; several are returned to choose from.
    func finishConnect(userID: String, for vehicle: Vehicle) async throws -> [SmartcarAPI.Vehicle] { /* private */ }

    func link(_ car: SmartcarAPI.Vehicle, userID: String, to vehicle: Vehicle) async { /* private */ }

    /// Forgets the link and the readings. The access itself is revoked in the Smartcar Dashboard
    /// or the maker's app; without the link iDrive never asks again.
    func unlink(_ vehicle: Vehicle) { /* private */ }

    /// Asks the car for its figures; without `force` only when the last answer is older than
    /// `minimumInterval`.
    func refresh(_ vehicle: Vehicle, force: Bool = false, now: Date = .now) async { /* private */ }

    /// The owner sees why, never Smartcar's raw body.
    static func message(for error: any Error) -> String { /* private */ }

    private func saveLinks() { /* private */ }

    private func saveReadings() { /* private */ }
}

#if DEBUG
    /// The demo car: Smartcar's simulator-like figures, a little different on each refresh.
    nonisolated struct SmartcarDemo: SmartcarBackend {
        func vehicles(userID: String) async throws -> [SmartcarAPI.Vehicle] { /* private */ }

        func reading(vehicleID: String, userID: String) async throws -> CarReading { /* private */ }
    }
#endif
