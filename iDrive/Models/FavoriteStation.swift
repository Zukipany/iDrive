// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

/// A fuel station the driver starred, to check its prices quickly. Keeps the last prices
/// seen, so the list shows something (marked with its age) before new ones arrive.
@Model
final class FavoriteStation {
    @Attribute(.unique) var stationID: String
    var name: String
    var brand: String
    var address: String
    var latitude: Double
    var longitude: Double
    var addedAt: Date
    var lastE5: Double?
    var lastE10: Double?
    var lastDiesel: Double?
    var lastIsOpen: Bool?
    var pricesUpdatedAt: Date?

    init(station: Station, addedAt: Date = .now) { /* private */ }

    var displayName: String { /* private */ }

    func update(e5: Double?, e10: Double?, diesel: Double?, isOpen: Bool, at date: Date) { /* private */ }

    func update(from prices: StationPrices, at date: Date) { /* private */ }

    func lastPrice(for fuel: FuelType) -> Double? { /* private */ }

    /// The favourite as a station value, for the detail page and price display. Distance
    /// is measured from `origin` when known.
    func station(from origin: (latitude: Double, longitude: Double)?) -> Station { /* private */ }

    private static func km(from a: (latitude: Double, longitude: Double), to b: (Double, Double)) -> Double { /* private */ }
}
