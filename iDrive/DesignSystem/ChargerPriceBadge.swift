// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Map pin for a charger with a published price: "⚡ 0,79 €".
/// Same rules as `PriceBadge`: content layer, so no Liquid Glass; the cheapest charger
/// gets a star as well as a green border, so price level doesn't rely on colour alone.
struct ChargerPriceBadge: View {
    let charger: ChargePoint
    let tier: StationRanking.Tier?

    var body: some View { /* private */ }

    private var borderColor: Color { /* private */ }

    private var accessibilityText: String { /* private */ }
}
