// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// A drive recorded from the iPhone's location: who, when, the trace, and what it says about
/// the roads and the driving (`RideAnalysis`). Kept on the iPhone only (`RideStore`).
nonisolated struct Ride: Codable, Equatable, Identifiable, Sendable {
    struct Point: Codable, Equatable, Sendable {
        let time: Date
        let latitude: Double
        let longitude: Double
        /// m/s from GPS; negative when unknown.
        let speed: Double
        /// m above sea level; nil when unknown.
        let altitude: Double?

        var coordinate: CLLocationCoordinate2D { /* private */ }
    }

    /// How the car was recognised.
    enum Recognition: String, Codable, Sendable {
        /// Its CarPlay connected.
        case carPlay
        /// Its Bluetooth (hands-free or audio), linked to it.
        case bluetooth
        /// A Shortcut started the drive ("When CarPlay connects").
        case shortcut
        /// Older drives: the car's CarPlay or Bluetooth audio, before the two were told apart.
        case carAudio
        /// No car connection: the active car in the Garage.
        case activeCar
    }

    var id
    /// `Vehicle.reminderID` of the car.
    var carID: String
    var carName: String
    var recognition: Recognition
    /// The car connection's name ("BMW 41532"), when there was one.
    var audioPort: String?
    /// Its id, so the drive ends when that car disconnects.
    var audioUID: String?
    var points: [Point]

    var start: Date? { /* private */ }
    var end: Date? { /* private */ }
}

/// What a ride's trace says, for the consumption engine and the developer panel.
nonisolated struct RideAnalysis: Codable, Equatable, Sendable {
    /// Speed bands by GPS speed: city below 50 km/h, country roads to 90, motorway above.
    static let cityKmh
    static let motorwayKmh
    /// Below this the car stands (traffic lights, jams).
    static let standingKmh
    /// Speeding up or braking harder than this (m/s², over at least a second) counts as harsh.
    static let harshAcceleration
    static let harshBraking
    /// GPS points further apart than this (a tunnel, the app stopped) don't count as driving.
    static let maxGap: TimeInterval

    let km: Double
    let duration: TimeInterval
    /// Time with the car moving.
    let movingTime: TimeInterval
    /// km/h over the moving time.
    let averageKmh: Double
    /// km/h, the 95th percentile so a GPS spike doesn't count.
    let topKmh: Double
    /// Shares of the km: city, country roads, motorway (they add up to 1).
    let cityShare: Double
    let ruralShare: Double
    let motorwayShare: Double
    /// Stops (standing 10 s or more) per 10 km.
    let stopsPer10km: Double
    /// Harsh accelerations and brakings per 100 km.
    let harshPer100km: Double
    /// Metres climbed per 100 km.
    let climbPer100km: Double

    init?(_ points: [Ride.Point]) { /* private */ }

    /// Running sums over the trace's segments.
    private struct Totals {
        var km , moving , cityKm , ruralKm , motorwayKm , climb
        var stops , harsh
        var standingSince: Date?
        var speeds: [Double]

        mutating func add(from previous: Ride.Point, to point: Ride.Point) { /* private */ }

        /// A stop is standing 10 s or more, counted when the car moves again.
        private mutating func countStanding(kmh: Double, previous: Ride.Point, point: Ride.Point, seconds: TimeInterval) { /* private */ }
    }

    /// Thins a live trace for storage: a point every 5 s or 50 m, whichever comes first,
    /// keeping every speed change that matters for the harsh-driving count.
    static func shouldKeep(_ point: Ride.Point, after last: Ride.Point?) -> Bool { /* private */ }
}
