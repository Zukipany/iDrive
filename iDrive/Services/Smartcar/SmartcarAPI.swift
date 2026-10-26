// Source code is private. This file shows only its types and signatures.

import Foundation

/// Smartcar (smartcar.com): one API for the connected-car accounts of 40+ brands. The owner
/// logs in with their car brand's account once (Smartcar Connect) and allows iDrive to read
/// the odometer, the fuel tank and the battery; from then on the car's own figures come in
/// without any extra hardware. API v3 (v2.0 ends on 1 Dec 2026).
///
/// v3 authenticates the app, not the user: a client secret buys a 1-hour token that reads
/// every car connected to the app, scoped per request by the owner's `user_id`. Smartcar
/// requires that secret to stay on a server, so release builds go through a small proxy
/// (tools/smartcar-proxy); only debug builds may call Smartcar directly, for testing.
nonisolated enum SmartcarAPI {
    static let connectURL
    static let tokenURL
    static let vehicleAPI

    /// What iDrive asks the owner for: mileage, tank and battery, and which car it is.
    static let permissions

    enum Mode: String, Sendable {
        /// Real cars, logged in with the brand's account.
        case live
        /// Cars made in the Smartcar Dashboard's Vehicle Simulator.
        case simulated
    }

    /// iOS apps come back through `sc<application ID>://exchange`, registered in the Dashboard
    /// (Application details). The application ID is the app's UUID, not the `client_…` ID of
    /// the token flow.
    static func callbackScheme(applicationID: String) -> String { /* private */ }

    static func redirectURI(applicationID: String) -> String { /* private */ }

    /// The Connect page the owner logs in on.
    static func connect(applicationID: String, mode: Mode, state: String, country: String?) -> URL { /* private */ }

    enum ConnectResult: Equatable, Sendable {
        case connected(userID: String)
        case failed(error: String, description: String?)
    }

    enum ConnectError: LocalizedError, Equatable {
        /// The redirect's `state` isn't the one sent: not this login.
        case stateMismatch
        case unexpectedRedirect

        var errorDescription: String? { /* private */ }
    }

    /// Connect's redirect: `…?user_id=…&state=…`, or `…?error=access_denied&error_description=…`.
    static func parse(callback url: URL, state: String) throws -> ConnectResult { /* private */ }

    // MARK: Responses

    struct Vehicle: Equatable, Identifiable, Sendable {
        let id: String
        let make: String
        let model: String
        let year: Int?

        /// "BMW X5 2024", "Mercedes-Benz C 300 2023" (Smartcar sends makes in capitals).
        var title: String { /* private */ }
    }

    /// GET /connections?filter[userId]=…: the owner's connected cars.
    static func decodeVehicles(_ data: Data) throws -> [Vehicle] { /* private */ }

    /// GET /vehicles/{id}/signals: every signal the car reports, each with its own unit and time.
    static func decodeReading(_ data: Data, now: Date) throws -> CarReading { /* private */ }

    /// Smartcar reports in the car's own units ("km", "miles").
    static func kilometers(_ value: Double, unit: String) -> Double { /* private */ }

    /// "liters", "gallons" (US).
    static func liters(_ value: Double, unit: String) -> Double { /* private */ }
}

// MARK: Smartcar's JSON (v3, JSON:API style)

nonisolated private struct Reference: Decodable { let id: String }

nonisolated private struct Related: Decodable { let data: Reference }

nonisolated private struct VehicleSummary: Decodable {
    let make: String
    let model: String
    let year: Int?
}

nonisolated private struct ConnectionAttributes: Decodable { let vehicle: VehicleSummary }

nonisolated private struct ConnectionRelationships: Decodable { let vehicle: Related }

nonisolated private struct Connection: Decodable {
    let attributes: ConnectionAttributes
    let relationships: ConnectionRelationships
}

nonisolated private struct ConnectionsResponse: Decodable { let data: [Connection] }

nonisolated private struct SignalStatus: Decodable { let value: String }

nonisolated private struct SignalBody: Decodable {
    let value: LooseNumber?
    let unit: String?
}

nonisolated private struct SignalAttributes: Decodable {
    let code: String
    let status: SignalStatus
    let body: SignalBody?
}

nonisolated private struct SignalMeta: Decodable {
    let retrievedAt: String?
    let oemUpdatedAt: String?
}

nonisolated private struct Signal: Decodable {
    let attributes: SignalAttributes
    let meta: SignalMeta?
}

nonisolated private struct SignalsResponse: Decodable { let data: [Signal] }

/// What the car itself last reported, stored in km, litres and percent.
nonisolated struct CarReading: Codable, Equatable, Sendable {
    var odometerKm: Double?
    /// 0…100
    var fuelPercent: Double?
    var fuelLiters: Double?
    var fuelRangeKm: Double?
    /// 0…100 (0…1 from some cars is read as a share)
    var batteryPercent: Double?
    var batteryRangeKm: Double?
    /// When the car sent the newest of these figures.
    var reportedAt: Date
    /// When iDrive asked.
    var fetchedAt: Date

    /// Tank (or battery) level 0…1 for the planner and the fill-up form: the percentage, else
    /// litres over the tank size.
    func level(electric: Bool, capacity: Double?) -> Double? { /* private */ }

    func rangeKm(electric: Bool) -> Double? { /* private */ }

    /// Older than this, the car has been parked or offline: shown, but not used to prefill.
    static let freshFor: TimeInterval

    func isFresh(at date: Date) -> Bool { /* private */ }
}

/// Where vehicle data comes from: a proxy that holds the secret (release), or Smartcar
/// itself with the secret in the app (debug builds only).
nonisolated protocol SmartcarBackend: Sendable {
    func vehicles(userID: String) async throws -> [SmartcarAPI.Vehicle]
    func reading(vehicleID: String, userID: String) async throws -> CarReading
}

/// The developer's own proxy (tools/smartcar-proxy): `GET /vehicles` and `GET /vehicles/{id}/signals`
/// with the owner's id in `sc-user-id`; it adds the token and returns Smartcar's answer unchanged.
nonisolated struct SmartcarProxy: SmartcarBackend {
    let baseURL: URL
    /// A shared key so the proxy only answers this app.
    let appKey: String
    var fetch: HTTP.Fetcher
    var now: @Sendable () -> Date

    private func request(_ path: String, userID: String) -> URLRequest { /* private */ }

    func vehicles(userID: String) async throws -> [SmartcarAPI.Vehicle] { /* private */ }

    func reading(vehicleID: String, userID: String) async throws -> CarReading { /* private */ }
}

#if DEBUG
    nonisolated private struct SmartcarToken: Decodable {
        let accessToken: String
        let expiresIn: Double?
    }

    /// Debug builds only: Smartcar directly, with the `client_…` ID and its secret from Secrets.xcconfig. Smartcar
    /// forbids secrets in shipped apps (the token reads every connected car), so release builds
    /// never contain this or the secret (project.yml empties it for Release).
    actor SmartcarDirect: SmartcarBackend {
        private let clientID: String
        private let clientSecret: String
        private let fetch: HTTP.Fetcher
        private var token: (value: String, expires: Date)?

        init(clientID: String, clientSecret: String, fetch: @escaping HTTP.Fetcher = HTTP.data(for:)) { /* private */ }

        /// One token for an hour, renewed a minute early.
        private func accessToken() async throws -> String { /* private */ }

        private func request(_ url: URL, userID: String) async throws -> URLRequest { /* private */ }

        func vehicles(userID: String) async throws -> [SmartcarAPI.Vehicle] { /* private */ }

        func reading(vehicleID: String, userID: String) async throws -> CarReading { /* private */ }
    }
#endif
