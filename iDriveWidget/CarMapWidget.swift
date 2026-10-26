// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// The large widget: a map of the cheapest stations for the car's fuel, with prices on it,
/// above the selected car with its mileage, range and this month's spending.
struct CarMapWidget: Widget {
    var body: some WidgetConfiguration { /* private */ }
}

struct CarMapView: View {
    let entry: HomeEntry

    var body: some View { /* private */ }
}

/// The map picture with a pin for each station that has room, the others as dots, and the
/// blue dot where the search was. Each pin opens its station.
private struct MapArea: View {
    let entry: HomeEntry
    let size: CGSize
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.widgetRenderingMode) private var renderingMode

    var body: some View { /* private */ }

    @ViewBuilder private func spots(_ prices: WidgetSnapshot.Prices, on picture: WidgetMap.Picture) -> some View { /* private */ }
}

/// The car with its figures, and how old the prices are. Compact, so the map gets the room.
private struct CarPanel: View {
    let entry: HomeEntry

    var body: some View { /* private */ }

    private func header(_ car: WidgetSnapshot.Car) -> some View { /* private */ }

    private func facts(_ car: WidgetSnapshot.Car) -> some View { /* private */ }

    private func fact(_ title: LocalizedStringKey, _ value: String) -> some View { /* private */ }

    /// A due inspection or service comes first; otherwise the prices' age and the saving.
    private func footer(_ prices: WidgetSnapshot.Prices) -> some View { /* private */ }
}
