// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

/// The average board price per fuel around the last map search, so a fill-up logged soon
/// after can tell what choosing its station saved. Kept in UserDefaults between launches.
/// A reference older than 12 hours isn't used: German prices change several times a day.
@MainActor
final class NearbyPrices {
    static let shared
    static let maxAge: TimeInterval
    /// A fill-up logged before the map was opened gets the average if it's this recent.
    static let backfillWindow: TimeInterval

    nonisolated struct Reference: Codable, Equatable, Sendable {
        let average: Double
        let count: Int
        let at: Date
        let radiusKm: Double
    }

    private let defaults: UserDefaults
    private static let key
    private(set) var references: [FuelType: Reference]

    init(defaults: UserDefaults = .standard) { /* private */ }

    /// The average price for `fuel` around `date`, if a map search was close enough in time.
    func average(for fuel: FuelType, at date: Date) -> Double? { /* private */ }

    /// Board prices (before fuel-card discounts) of the open stations that report them.
    func record(stations: [Station], radiusKm: Double, at date: Date) { /* private */ }

    /// Ad-hoc prices of chargers that publish one, AC and DC separately.
    func record(chargers: [ChargePoint], radiusKm: Double, at date: Date) { /* private */ }

    /// Gives recent fill-ups without a reference this one, when the map opened after logging.
    func backfill(in context: ModelContext, now: Date = .now) { /* private */ }

    private func store(_ prices: [Double], for fuel: FuelType, radiusKm: Double, at date: Date) { /* private */ }
}
