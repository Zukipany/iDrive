// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// The medium widget: the selected car on the left, the cheapest stations for its fuel on
/// the right. Each station opens its page in the app.
struct NearbyPricesWidget: Widget {
    var body: some WidgetConfiguration { /* private */ }
}

struct NearbyPricesView: View {
    let entry: HomeEntry
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    /// Four rows fit at the usual text sizes, fewer at the larger ones.
    private var rows: Int { /* private */ }

    var body: some View { /* private */ }
}

/// The car's picture, name, mileage and range, and which fuel the prices are for.
private struct CarColumn: View {
    let entry: HomeEntry

    var body: some View { /* private */ }
}
