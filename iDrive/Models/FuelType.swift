// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Every energy type the app can price, filter, log and chart.
/// Stored in SwiftData as its `rawValue` so `#Predicate` can filter on it.
nonisolated enum FuelType: String, Codable, CaseIterable, Identifiable, Sendable {
    case e5, e10, diesel, dieselPremium, evAC, evDC

    var id: Self { /* private */ }

    /// What a car runs on. A car can tank several fuels of one kind (E5 and E10, or
    /// diesel and premium diesel), never petrol and diesel.
    enum Kind: String, CaseIterable, Identifiable, Sendable {
        case petrol, diesel, electric
        var id: Self { /* private */ }

        var fuels: [FuelType] { /* private */ }

        /// The usual choice when this kind is picked.
        var defaultFuel: FuelType { /* private */ }

        var label: String { /* private */ }
    }

    static let combustion: [FuelType]
    static let electric: [FuelType]
    /// The fuels German stations must report to the MTS-K, so Tankerkönig has prices for
    /// them. Premium fuels (Aral Ultimate Diesel, Shell V-Power Diesel…) aren't reported.
    static let publiclyPriced: [FuelType]
    /// The map's filter chips.
    static let mapFilters: [FuelType]

    /// Premium diesel prices are estimated (diesel + typical surcharge) and shown with "≈".
    var isPriceEstimated: Bool { /* private */ }

    var isElectric: Bool { /* private */ }

    var kind: Kind { /* private */ }

    /// Unit symbol shown next to amounts ("52,00 l", "41,30 kWh").
    var unitSymbol: String { /* private */ }

    var label: String { /* private */ }

    /// Compact label for chips and pins.
    var shortLabel: String { /* private */ }

    var symbol: String { /* private */ }

    /// One system colour per fuel, used for fills and symbols only.
    /// Never use it as text colour: system green/teal/orange on white are below 4.5:1.
    var color: Color { /* private */ }
}
