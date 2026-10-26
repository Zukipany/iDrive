// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// One moment of the Home Screen widgets: the car and the prices the app shared last.
struct HomeEntry: TimelineEntry {
    let date: Date
    let car: WidgetSnapshot.Car?
    let prices: WidgetSnapshot.Prices?
    /// The large widget's map; nil in the others, and when MapKit couldn't draw it (offline).
    var map: WidgetMap.Picture?

    /// Prices older than `WidgetSnapshot.staleAfter` say so.
    var isStale: Bool { /* private */ }

    /// What the app shared last.
    static func current(at date: Date = .now) -> HomeEntry { /* private */ }
}

/// Reads the App Group snapshot and never calls a price API itself: the app loads prices on
/// demand (Tankerkönig's fair use) and reloads the widgets when it has new ones.
struct HomeProvider: TimelineProvider {
    /// The large widget draws a map of the stations.
    var drawsMap

    func placeholder(in context: Context) -> HomeEntry { /* private */ }

    /// The widget gallery shows the sample until the app has shared prices.
    func getSnapshot(in context: Context, completion: @escaping (HomeEntry) -> Void) { /* private */ }

    /// Now, and again the moment the prices turn stale. No refresh schedule otherwise.
    func getTimeline(in context: Context, completion: @escaping (Timeline<HomeEntry>) -> Void) { /* private */ }

    private func withMap(_ entry: HomeEntry, size: CGSize) async -> HomeEntry { /* private */ }
}

extension HomeEntry {
    /// The gallery's and the placeholder's: a Golf near Marienplatz in Munich.
    static let sample
}
