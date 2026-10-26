// Source code is private. This file shows only its types and signatures.

import AVFoundation
import Observation

/// Which car the iPhone is in, from what it's connected to. When the iPhone joins a car's
/// CarPlay (wired or wireless) or its Bluetooth hands-free, iOS routes audio there and tells
/// apps the port's name ("BMW 41532", "MB Bluetooth") and a stable id for that car. That's all
/// iOS shares about the car (no VIN, no fuel level), and it's enough: the id is linked once to a
/// Garage car, and from then on that car is recognised whenever the iPhone connects to it.
///
/// Needs no permission. CarPlay always means a car; Bluetooth counts only once linked, since it
/// could be headphones.
@MainActor @Observable
final class CarConnection {
    static let shared

    /// One connection, as iOS reports it.
    nonisolated struct Port: Codable, Equatable, Sendable {
        enum Kind: String, Codable, Sendable {
            case carPlay, bluetooth
        }

        let kind: Kind
        let name: String
        let uid: String
    }

    /// A connection linked to a car, kept on the iPhone.
    nonisolated struct Link: Codable, Equatable, Identifiable, Sendable {
        let port: Port
        /// `Vehicle.reminderID`
        let carID: String
        let linkedAt: Date

        var id: String { /* private */ }
    }

    private static let linksKey
    /// The recorder's links before this type (uid → car).
    private static let oldLinksKey

    /// What the iPhone is connected to now; nil when it's no car.
    private(set) var port: Port?
    private(set) var links: [Link]
    /// The simulator has no car audio: the developer panel can pretend one.
    var simulated: Port? {
        didSet { /* private */ }
    }
    /// Called when a car connects or disconnects (the recorder starts and ends drives).
    @ObservationIgnored var onChange: (_ old: Port?, _ new: Port?) -> Void
    @ObservationIgnored private var observer: NSObjectProtocol?
    @ObservationIgnored private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) { /* private */ }

    /// Watches the audio route from now on.
    func start() { /* private */ }

    /// Reads the route: CarPlay first, then a Bluetooth car audio or hands-free port.
    func refresh() { /* private */ }

    /// The connection counts as a car: CarPlay, or a Bluetooth port linked to one.
    var isCar: Bool { /* private */ }

    func link(for port: Port) -> Link? { /* private */ }

    /// The car the current connection is linked to.
    var linkedCarID: String? { /* private */ }

    func link(_ port: Port, to vehicle: Vehicle, now: Date = .now) { /* private */ }

    func unlink(_ uid: String) { /* private */ }

    private func save() { /* private */ }
}

/// Guesses which Garage car a connection belongs to, from its name: cars name their CarPlay and
/// Bluetooth after the brand ("BMW 41532", "VW BT 1234", "MB Bluetooth", "Audi MMI 0815").
nonisolated enum CarMatcher {
    struct Candidate: Equatable, Sendable {
        let id: String
        let name: String
        let make: String
        let model: String
    }

    /// Short names the cars use for themselves.
    static let aliases: [String: [String]]

    /// The candidate whose make, model or name appears in `portName`; nil when none or a tie.
    static func best(for portName: String, among cars: [Candidate]) -> Candidate? { /* private */ }

    private static func normalized(_ text: String) -> String { /* private */ }
}
