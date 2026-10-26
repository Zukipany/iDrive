// Source code is private. This file shows only its types and signatures.

import Foundation

/// Every amount the app shows or reads goes through here: stored km, litres and euros in, the
/// driver's units out (and back for what they type). Reads `UnitSettings`, so views redraw
/// when the Settings change.
nonisolated enum Units {
    static var preferences: UnitPreferences { /* private */ }

    // MARK: Money

    /// Euros in the driver's currency: "84,46 €", "71,46 £". Euros when the rate is unknown.
    static func money(_ euros: Double, decimals: Int? = nil) -> String { /* private */ }

    /// The amount in the driver's currency, and that currency's code.
    static func converted(_ euros: Double) -> (value: Double, code: String) { /* private */ }

    /// What the driver types, in their currency, back to euros.
    static func euros(fromCurrency value: Double) -> Double { /* private */ }

    /// "€", "£", "CHF"
    static var currencySymbol: String { /* private */ }

    // MARK: Prices

    /// A litre's price as the driver sees it: per litre or per gallon, two decimals with the
    /// currency sign ("2,07 €"). No tenth-of-a-cent digit.
    static func fuelPrice(_ eurosPerLiter: Double) -> String { /* private */ }

    /// A kWh's price: "0,59 €".
    static func chargingPrice(_ eurosPerKWh: Double) -> String { /* private */ }

    /// "€/l", "£/gal", "€/kWh"
    static func priceUnit(electric: Bool) -> String { /* private */ }

    /// The per-unit price the driver types (currency per litre, gallon or kWh), from euros per litre or kWh.
    static func priceValue(eurosPerUnit: Double, electric: Bool) -> Double { /* private */ }

    static func eurosPerUnit(fromPrice value: Double, electric: Bool) -> Double { /* private */ }

    // MARK: Distance

    /// On the road: "410 m", "1,3 km", "24 km"; "0.3 mi", "7.8 mi", "15 mi".
    static func distance(_ km: Double) -> String { /* private */ }

    /// Whole units, for odometers and ranges: "48.210 km", "29.957 mi".
    static func wholeDistance(_ km: Double) -> String { /* private */ }

    static func wholeDistance(_ km: Int) -> String { /* private */ }

    static var distanceSymbol: String { /* private */ }

    /// km in the driver's unit.
    static func distanceValue(km: Double) -> Double { /* private */ }

    static func km(fromDistance value: Double) -> Double { /* private */ }

    /// An odometer the driver types, to whole km.
    static func odometerKm(fromDistance value: Int) -> Int { /* private */ }

    /// A stored odometer in the driver's unit.
    static func odometerValue(km: Int) -> Int { /* private */ }

    // MARK: Volume

    /// "41,2 l", "10,9 gal"; kWh as they are ("38,5 kWh").
    static func volume(_ amount: Double, electric: Bool, decimals: Int = 1) -> String { /* private */ }

    /// "l", "gal" or "kWh"
    static func amountSymbol(electric: Bool) -> String { /* private */ }

    static func volumeValue(liters: Double) -> Double { /* private */ }

    static func liters(fromVolume value: Double) -> Double { /* private */ }

    /// An amount the driver types (litres, gallons or kWh) to litres or kWh.
    static func storedAmount(fromVolume value: Double, electric: Bool) -> Double { /* private */ }

    static func volumeValue(stored amount: Double, electric: Bool) -> Double { /* private */ }

    // MARK: Consumption

    /// With gallons, distance per gallon (miles per gallon: higher is better); otherwise
    /// litres or kWh per 100 km or miles.
    static func perGallon(electric: Bool) -> Bool { /* private */ }

    /// "6,3 l/100 km", "37,3 mpg", "17,2 kWh/100 km", "27,7 kWh/100 mi"
    static func consumption(_ per100km: Double, electric: Bool, decimals: Int = 1) -> String { /* private */ }

    static func consumptionUnit(electric: Bool) -> String { /* private */ }

    /// l (or kWh) per 100 km in the driver's unit.
    static func consumptionValue(per100km: Double, electric: Bool) -> Double { /* private */ }

    /// What the driver types back to l (or kWh) per 100 km.
    static func per100km(fromConsumption value: Double, electric: Bool) -> Double { /* private */ }

    /// "8,40 €/100 km", "11,51 £/100 mi"
    static func costPer100(_ eurosPer100km: Double) -> String { /* private */ }

    /// "0,08 €" a km or mile.
    static func costPerDistance(_ eurosPerKm: Double) -> String { /* private */ }

    // MARK: Speed

    /// "92 km/h", "57 mph"
    static func speed(_ kmh: Double) -> String { /* private */ }
}

nonisolated extension Units {
    /// How a number the driver types maps to what's stored, and its unit label. What's shown
    /// is rounded to what a person would type; what's stored stays exact until they edit it.
    enum Conversion: Sendable {
        case none
        /// km
        case distance
        /// Litres (or kWh when electric).
        case volume(electric: Bool)
        /// l (or kWh) per 100 km.
        case consumption(electric: Bool)
        /// Euros.
        case money
        /// Euros per litre (or kWh).
        case unitPrice(electric: Bool)

        func display(_ stored: Double) -> Double { /* private */ }

        func stored(_ display: Double) -> Double { /* private */ }

        /// "km", "gal", "mpg", "€", "€/l"; nil for `.none`.
        var unit: String? { /* private */ }

        private func rounded(_ value: Double, _ decimals: Int) -> Double { /* private */ }
    }
}

nonisolated extension Units {
    /// A value already in the driver's currency (chart axes): "120 £".
    static func currency(_ value: Double, decimals: Int? = nil) -> String { /* private */ }
}

nonisolated extension Units {
    /// A place along a route, from its start: "km 240", "mile 149".
    static func routeMark(_ km: Double) -> String { /* private */ }
}
