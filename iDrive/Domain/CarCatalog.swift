// Source code is private. This file shows only its types and signatures.

import Foundation

/// Bundled list of popular cars sold in Germany, for autocomplete and suggested values.
/// Values are typical, not exact; the form says so and everything stays editable.
nonisolated struct CarCatalog: Decodable, Sendable {
    struct Variant: Decodable, Hashable, Sendable {
        enum Fuel: String, Decodable, Sendable { case petrol, diesel, electric, plugInHybrid }
        /// The exact version ("xDrive40d", "AMG G 63"); nil for a typical value per fuel.
        let name: String?
        let fuel: Fuel
        let tank: Double?
        /// Usable battery, kWh.
        let battery: Double?
        /// l/100 km, or kWh/100 km for an electric car. A plug-in hybrid's is with an empty battery.
        let consumption: Double
        /// A plug-in hybrid's WLTP electricity use, kWh/100 km.
        let electricConsumption: Double?

        /// "Diesel · 80 l · 7,6 l/100 km", or for a plug-in hybrid
        /// "Plug-in hybrid · 69 l + 25,7 kWh · 9,2 l or 25 kWh/100 km"
        var summary: String { /* private */ }

        var label: String { /* private */ }
    }

    struct Car: Decodable, Hashable, Sendable, Identifiable {
        let make: String
        let model: String
        let generation: String
        let from: Int
        let to: Int
        let body: BodyType
        let variants: [Variant]

        var id: String { /* private */ }
        var years: ClosedRange<Int> { /* private */ }
    }

    /// Generations with typical values (CarCatalog.json).
    let cars: [Car]
    /// Model names per make, for the pickers (CarModels.json). Includes models without specs.
    var modelNames: [String: [String]]
    /// The most registered makes in Germany, shown first in the make picker.
    var popularMakes: [String]

    private enum CodingKeys: String, CodingKey { case cars }

    private struct ModelList: Decodable {
        let makes: [String: [String]]
        let popular: [String]
    }

    static let shared: CarCatalog

    /// Every make, A–Z.
    var allMakes: [String] { /* private */ }

    /// Every model of a make, A–Z, including ones with typical values.
    func allModels(of make: String) -> [String] { /* private */ }

    /// Generations with typical values for one model, newest first.
    func generations(make: String, model: String) -> [Car] { /* private */ }

    func car(id: String) -> Car? { /* private */ }

    /// Common short names people type.
    private static let makeAliases

    /// Makes matching what the user typed, best match first.
    func makes(matching text: String) -> [String] { /* private */ }

    /// The make spelled as in the catalog ("vw" → "Volkswagen"), if it's known.
    func canonicalMake(_ text: String) -> String? { /* private */ }

    /// Model names for a make, filtered by what's typed.
    func models(of make: String, matching text: String) -> [String] { /* private */ }

    /// The generation for a make, model and year: the one whose years include it, else the newest.
    func car(make: String, model: String, year: Int?) -> Car? { /* private */ }

    /// Case- and accent-insensitive key: "Škoda" and "skoda" match.
    static func fold(_ text: String) -> String { /* private */ }
}
