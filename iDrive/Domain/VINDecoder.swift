// Source code is private. This file shows only its types and signatures.

import Foundation

/// Reads what a 17-character VIN reveals, offline.
///
/// What a VIN can tell (ISO 3779): the maker and plant (characters 1–3), for many
/// makers the model year (character 10) and for some a model code (VW group: 7–8,
/// Tesla: 4). What it can't tell: mileage, colour or equipment. Those aren't encoded.
/// Measured on 7 Oct 2026: NHTSA's free decoder found make, year and plant for an EU
/// Volkswagen VIN but no model, and didn't know Tesla's Berlin plant at all, so this
/// decoder carries its own tables.
nonisolated enum VINDecoder {
    struct Info: Equatable, Sendable {
        var make: String
        var model: String?
        var modelYear: Int?
        var plantCountry: String?
    }

    enum Problem: Error, Equatable {
        case wrongLength(Int)
        /// I, O and Q are never used in VINs (they look like 1 and 0).
        case invalidCharacters
        case unknownManufacturer(String)
    }

    /// Uppercased, without spaces and dashes.
    static func clean(_ vin: String) -> String { /* private */ }

    static func decode(_ raw: String, currentYear: Int = Calendar.current.component(.year, from: .now)) -> Result<Info, Problem> { /* private */ }

    /// VINs found in OCR text from a photo of the registration certificate (field E) or
    /// the windscreen. OCR often splits the number into groups and reads 0 as O, so
    /// neighbouring groups are joined and I/O/Q (never used in VINs) become 1/0/0.
    /// Numbers from a known maker come first.
    static func candidates(in lines: [String]) -> [String] { /* private */ }

    private static func isKnown(_ vin: String) -> Bool { /* private */ }

    /// Format check only: 17 allowed characters, maker not required.
    private static func validated(_ vin: String) -> Result<Void, Problem> { /* private */ }

    /// Character 10 → year. The code repeats every 30 years, so take the latest year
    /// that isn't more than a year in the future.
    static func modelYear(_ code: Character, currentYear: Int) -> Int? { /* private */ }

    private enum ModelScheme { case vwGroup, tesla, none }

    private struct Maker {
        let make: String
        let country: String
        /// Not every maker uses character 10 for the year in Europe (Mercedes and BMW often don't).
        let encodesYear: Bool
        let modelScheme: ModelScheme
    }

    private static func maker(
        _ make: String,
        _ country: String,
        year: Bool = false,
        scheme: ModelScheme = .none
    ) -> Maker { /* private */ }

    /// World manufacturer identifiers common on German roads.
    private static let manufacturers: [String: Maker]

    /// VW group model codes (characters 7–8). Only codes known to be reliable.
    private static let vwGroupModels: [String: [String: String]]
}
