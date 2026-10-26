// Source code is private. This file shows only its types and signatures.

import Foundation

/// What the assistant knows: a short fact sheet about the driver's cars and spending,
/// built fresh when the conversation starts, and a guide to the app. The on-device model
/// has a small context window, so both stay compact, and it's told never to invent numbers.
enum AssistantPrompt {
    static func instructions(facts: String, now: Date = .now) -> String { /* private */ }

    static let guide

    /// The fact sheet, in English (the model answers in the user's language anyway).
    @MainActor static func facts(active: Vehicle?, vehicles: [Vehicle], cards: [FuelCard], now: Date = .now) -> String { /* private */ }

    /// A plug-in hybrid mixes electric and petrol driving; the app estimates the split.
    @MainActor private static func hybridFacts(_ car: Vehicle, now: Date) -> [String] { /* private */ }

    @MainActor private static func spending(of car: Vehicle, now: Date) -> [String] { /* private */ }

    @MainActor private static func energy(of car: Vehicle) -> String { /* private */ }

    private static func number(_ value: Double) -> String { /* private */ }

    /// Euros in the driver's currency, written the English way: "€84.46", "£71.46".
    private static func money(_ euros: Double) -> String { /* private */ }

    /// A litre's (or kWh's) price per the driver's unit.
    private static func price(_ eurosPerUnit: Double, electric: Bool) -> String { /* private */ }

    private static func consumption(_ per100km: Double, electric: Bool) -> String { /* private */ }

    private static func distance(_ km: Double) -> String { /* private */ }

    private static func volume(_ amount: Double, electric: Bool) -> String { /* private */ }
}
