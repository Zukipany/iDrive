// Source code is private. This file shows only its types and signatures.

import Foundation

/// One price a charging subscription, card or membership gives: at some operators'
/// chargers, or (with no operators) at every other operator where the card is accepted.
nonisolated struct ChargingPlanRule: Codable, Hashable, Sendable {
    /// Operators as `normalized(_:)` gives them ("enbw", "ionity", "tesla", "aral pulse").
    /// Empty means every other operator: a roaming price.
    var operators: [String]
    /// €/kWh at AC chargers; nil when the plan has no price for AC there.
    var acPerKWh: Double?
    /// €/kWh at DC fast chargers; nil when the plan has no price for DC there.
    var dcPerKWh: Double?

    var isRoaming: Bool { /* private */ }

    func price(isFast: Bool) -> Double? { /* private */ }

    /// How an operator is compared: folded and without its legal form, so MobiData's
    /// "ENBW" and "Tesla, Inc." and OpenStreetMap's "IONITY GmbH" match the plan's operators.
    /// A separate company with a similar name ("EnBW Ostwürttemberg DonauRies") doesn't.
    static func normalized(_ operatorName: String) -> String { /* private */ }
}

/// A plan the driver added, by name, with its prices.
nonisolated struct ChargingPlan: Hashable, Sendable {
    let name: String
    let rules: [ChargingPlanRule]
}

/// The plan price used at one charger.
nonisolated struct AppliedChargingPlan: Hashable, Sendable {
    let planName: String
    let pricePerKWh: Double
    /// The plan's price for other networks, which only holds where the card is accepted.
    let isRoaming: Bool
}

nonisolated enum ChargingPlans {
    /// The cheapest price any of the plans gives at this charger. Within one plan the
    /// operator's own price comes first, then the plan's price for other networks.
    /// A charger without a known operator gets no plan price: nobody can say which cards work there.
    static func best(operatorName: String?, isFast: Bool, plans: [ChargingPlan]) -> AppliedChargingPlan? { /* private */ }

    private static func price(of plan: ChargingPlan, operator key: String, isFast: Bool) -> AppliedChargingPlan? { /* private */ }
}

/// Subscriptions common in Germany, with their prices as of October 2026 (Dr. Web,
/// ecomento, Einfach E-Auto, elektronik-zeit). Stored by id, so an app update can change the
/// prices without the driver adding the plan again.
nonisolated struct ChargingPlanPreset: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let summary: String
    let rules: [ChargingPlanRule]

    var plan: ChargingPlan { /* private */ }

    static let all: [ChargingPlanPreset]

    static func preset(id: String?) -> ChargingPlanPreset? { /* private */ }

    static let enbwS

    static let enbwL

    static let ionityPower

    static let ionityMotion

    /// 0.40–0.55 €/kWh depending on the site and time of day; the highest is used, so the
    /// map never promises less than the driver pays.
    static let tesla

    static let adac

    /// Operators a custom plan can be set for: the biggest networks in the MobiData BW feed,
    /// spelled as drivers know them.
    static let operators
}
