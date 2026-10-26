// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Price pin on the map. Pins are content, so no Liquid Glass (HIG: use it sparingly,
/// never in the content layer). Price level is shown by colour *and* a symbol for the
/// cheapest station, so it works with Differentiate Without Color.
struct PriceBadge: View {
    let station: Station
    let fuel: FuelType
    let tier: StationRanking.Tier?
    /// A small dot instead of the price, so dense areas stay readable.
    var isCompact

    var body: some View { /* private */ }

    private var badge: some View { /* private */ }

    private var borderColor: Color { /* private */ }

    private var accessibilityText: String { /* private */ }
}
