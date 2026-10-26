// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// The tabs of the nearby sheet: fuel, charging and favourites, as on the map's chips.
enum NearbyTab: String, Identifiable {
    case fuel, charging, favorites

    var id: Self { /* private */ }
}

/// A glass bar with one segment per tab and a highlight that slides to the chosen one; the
/// pages below can also be swiped.
struct NearbyTabBar: View {
    let tabs: [(tab: NearbyTab, title: String, symbol: String, count: Int?)]
    @Binding var selection: NearbyTab
    @Namespace private var highlight

    var body: some View { /* private */ }
}

/// The top of the fuel page: where prices start, the average, and how wide they spread,
/// in the map pins' colours (green cheap, red dear).
struct PriceSummaryCard: View {
    let stats: StationRanking.PriceStats
    let fuel: FuelType
    let tankLiters: Double?

    var body: some View { /* private */ }
}

/// The charging page's top: how many publish a price, the range, and the saving on a charge.
struct ChargerSummaryCard: View {
    let title: LocalizedStringKey
    let stats: StationRanking.PriceStats
    let total: Int
    /// Battery of the active car, for the saving on a 20–80 % charge.
    let batteryKWh: Double?

    var body: some View { /* private */ }
}

/// Cheapest to dearest as one bar, green to red like the pins, with the average marked.
struct SpreadBar: View {
    let min: Double
    let average: Double
    let max: Double

    var body: some View { /* private */ }
}
