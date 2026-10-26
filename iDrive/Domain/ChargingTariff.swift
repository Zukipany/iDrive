// Source code is private. This file shows only its types and signatures.

import Foundation

/// An operator's ad-hoc charging price: what you pay with a card at the charger,
/// without an app or contract. Published under the EU AFIR regulation.
///
/// Reading rules, based on the 1,035 tariffs in the MobiData BW feed (Oct 2026):
/// - EcoMovement and EnBW publish prices without VAT plus a VAT entry: VAT is added.
/// - Chargecloud publishes no VAT information. German price rules (PAngV) require consumer
///   prices to include VAT, so those prices are used as published.
/// - Time fees (blocking fees) are marked but not priced: OCPI defines TIME as €/hour, yet
///   the values only make sense per minute, so showing an amount could be off by 60×.
nonisolated struct ChargingTariff: Hashable, Sendable {
    /// €/kWh including VAT. Nil when the tariff has no energy price.
    let pricePerKWh: Double?
    /// € per charging session including VAT, when there is one.
    let sessionFee: Double?
    /// Whether a time-based fee applies, and from which minute (0 = from the start).
    let timeFeeAfterMinutes: Int?

    struct Component: Sendable {
        enum Kind: String, Sendable { case energy , flat , time , parkingTime }
        let kind: Kind
        /// As published.
        let price: Double
        /// True when `price` already includes VAT.
        let taxIncluded: Bool
        /// Sum of VAT percentages listed for this component.
        let vatPercent: Double
        /// The `min_duration` restriction of the element, in seconds.
        let minDuration: Int?
        /// True for restrictions other than `min_duration` (time of day, kWh, power, …).
        let hasOtherRestrictions: Bool

        var grossPrice: Double { /* private */ }
    }

    init(pricePerKWh: Double?, sessionFee: Double?, timeFeeAfterMinutes: Int?) { /* private */ }

    /// Builds a tariff from OCPI price components.
    init(components: [Component]) { /* private */ }

    /// "+ 0,99 € per session · time fee after 4 h", nil when there are no extra fees.
    var feeSummary: String? { /* private */ }

    /// Euro prices are shown to the cent; avoids 0.7899999 from VAT maths.
    private static func rounded(_ value: Double) -> Double { /* private */ }
}
