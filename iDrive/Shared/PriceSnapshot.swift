// Source code is private. This file shows only its types and signatures.

import Foundation

/// The latest prices the app loaded, shared with the widget through an App Group. The
/// widget never calls Tankerkönig itself (fair use: requests only on demand).
nonisolated struct PriceSnapshot: Codable, Equatable, Sendable {
    static let appGroup
    private static let key

    /// FuelType raw value, e.g. "e10".
    let fuel: String
    let fuelLabel: String
    let cheapestPrice: Double
    let cheapestStation: String
    let averagePrice: Double
    let stationCount: Int
    let updatedAt: Date
    /// The fuel-card discount already in `cheapestPrice` ("−2 ct ADAC"), if any.
    var discountLabel: String?

    static func load(from defaults: UserDefaults? = UserDefaults(suiteName: appGroup)) -> PriceSnapshot? { /* private */ }

    func save(to defaults: UserDefaults? = UserDefaults(suiteName: appGroup)) { /* private */ }

    /// Opens the map with this fuel: idrive://map?fuel=e10
    var url: URL? { /* private */ }
}
