// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// "Cheapest E10 nearby" on the Lock Screen: the prices the app loaded last. Tapping it
/// opens the map with that fuel. On the Home Screen, `TopFuelWidget` and the larger ones.
struct CheapestFuelWidget: Widget {
    var body: some WidgetConfiguration { /* private */ }
}

struct Entry: TimelineEntry {
    let date: Date
    let snapshot: PriceSnapshot?
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> Entry { /* private */ }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) { /* private */ }

    /// No refresh schedule: the app reloads the widget whenever it loads new prices.
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) { /* private */ }
}

struct CheapestFuelView: View {
    let entry: Entry
    @Environment(\.widgetFamily) private var family

    var body: some View { /* private */ }

    private func price(_ value: Double) -> String { /* private */ }
}
