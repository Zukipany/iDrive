// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

/// A charging subscription, card or membership the driver uses. Charger prices on the map
/// show the cheapest of the plan price and the ad-hoc price. Only the plan is stored,
/// never a card number.
@Model
final class ChargingCard {
    /// A `ChargingPlanPreset` id, or nil for a plan the driver set up.
    var presetID: String?
    var name: String
    /// The driver's own prices; presets use the app's current prices instead.
    var customRules: [ChargingPlanRule]
    var addedAt: Date

    init(preset: ChargingPlanPreset, addedAt: Date = .now) { /* private */ }

    init(name: String, rules: [ChargingPlanRule], addedAt: Date = .now) { /* private */ }

    var preset: ChargingPlanPreset? { /* private */ }

    var plan: ChargingPlan { /* private */ }

    /// The preset's summary, or "EnBW, Ionity · AC 0.45 · DC 0.55 €/kWh" for a custom plan.
    var summary: String { /* private */ }

    private static func describe(_ rule: ChargingPlanRule) -> String { /* private */ }
}
