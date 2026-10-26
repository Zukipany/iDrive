// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// The small widget: the three cheapest stations nearby for the selected car's fuel.
struct TopFuelWidget: Widget {
    var body: some WidgetConfiguration { /* private */ }
}

struct TopFuelView: View {
    let entry: HomeEntry

    var body: some View { /* private */ }

    /// "E10 · Golf", with a warning when the prices are old.
    private func header(_ prices: WidgetSnapshot.Prices) -> some View { /* private */ }

    private func row(_ station: WidgetSnapshot.Prices.Station, rank: Int, prices: WidgetSnapshot.Prices) -> some View { /* private */ }
}
