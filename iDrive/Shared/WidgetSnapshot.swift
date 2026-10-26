// Source code is private. This file shows only its types and signatures.

import CoreGraphics
import Foundation

/// What the Home Screen widgets show, shared through the App Group: the selected car, and
/// the best stations for its fuel from the app's last map search. The widgets never call a
/// price API themselves (Tankerkönig's fair use: requests only on demand). The app writes
/// the car when it goes to the background (every fill-up changes its figures) and the
/// prices after each map load; the two are kept apart so neither overwrites the other.
nonisolated enum WidgetSnapshot {
    /// Stations kept: the large widget's map and the medium list show up to this many.
    static let maxStations
    /// Prices older than this are marked as such: stations change them many times a day.
    static let staleAfter: TimeInterval

    struct Car: Codable, Equatable, Sendable {
        static let key

        let name: String
        /// "BMW X5 xDrive50e"
        let model: String
        /// FuelType raw value of its main fuel: "e10", "diesel", "evAC" …
        let fuel: String
        let isElectric: Bool
        let odometer: Int?
        /// km on a full tank (or battery) at the measured consumption.
        let rangeKm: Int?
        /// Spent on fuel and charging this month, in euros.
        let monthSpent: Double
        /// "TÜV in 21 days", when an inspection or service is due within 60 days or overdue.
        let reminder: String?
        let reminderIsOverdue: Bool
        /// The car's photo, shrunk for the widget (at most 360 px wide).
        let photo: Data?
        /// SF Symbol of the body style, drawn when there's no photo.
        let symbol: String
        /// Which full-size photo `photo` was made from, so it's shrunk only once.
        let photoID: String?
    }

    struct Prices: Codable, Equatable, Sendable {
        static let key

        struct Station: Codable, Equatable, Identifiable, Sendable {
            /// The map's tag for it: "fuel-<id>" or "ev-<id>" (`MapDestination`).
            let id: String
            let name: String
            /// What the driver pays per litre or kWh, after their best card discount; nil for a
            /// charger that doesn't publish a price.
            let price: Double?
            /// "−2 ct ADAC"
            let discountLabel: String?
            /// km from where the search was.
            let distanceKm: Double?
            let latitude: Double
            let longitude: Double
        }

        /// FuelType raw value of the prices.
        let fuel: String
        /// "E10", "Diesel", "AC"
        let fuelLabel: String
        let isElectric: Bool
        /// Cheapest first; open stations only.
        let stations: [Station]
        let averagePrice: Double?
        /// Where the search was (the iPhone's location then): the large widget's blue dot.
        let latitude: Double
        let longitude: Double
        let updatedAt: Date

        /// Cents a litre (or kWh) the cheapest is below the average: 6.2 means 6,2 ct less.
        var cheapestSaving: Double? { /* private */ }

        func isStale(at date: Date) -> Bool { /* private */ }

        /// The map with this fuel, or one station's page on it.
        func link(to station: Station? = nil) -> URL? { /* private */ }
    }

    static func load<Value: Decodable>(_ type: Value.Type, key: String, from defaults: UserDefaults? = shared) -> Value? { /* private */ }

    static func save(_ value: (some Encodable)?, key: String, to defaults: UserDefaults? = shared) { /* private */ }

    private static var shared: UserDefaults? { /* private */ }

    /// Where a station's price pin goes on the large widget's map, around its spot.
    enum PinPlacement: CaseIterable, Equatable, Sendable {
        /// Standing on its spot, hanging below it, or beside it.
        case above, below, right, left
    }

    /// The pin's dot is this wide and sits this far in from the pin's end.
    static let pinDot , pinDotGap

    /// A pin's frame, with its dot centred on `point`. Above or below: `pinSize`, the dot under
    /// or over the price. Beside: the price with the dot to its side.
    static func pinFrame(_ placement: PinPlacement, at point: CGPoint, pinSize: CGSize) -> CGRect { /* private */ }

    /// Pins for the stations in ranking order (cheapest first): each takes the first free place
    /// around its spot (above, below, right, left) inside `bounds`. The first `guaranteed` (the
    /// cheapest) always get one, where it covers least if none is free; the others stay dots.
    static func pinPlacements(
        _ spots: [(id: String, point: CGPoint)],
        pinSize: CGSize,
        in bounds: CGRect,
        guaranteed: Int = 3
    ) -> [String: PinPlacement] { /* private */ }

    /// How much of `frame` the pins already placed cover, in square points.
    private static func covered(_ frame: CGRect, by placed: [CGRect]) -> Double { /* private */ }
}

/// idrive://map?fuel=e10&station=fuel-<id>: the map with a fuel and, from a widget, one
/// station's page. The app handles it in `RootTabView`.
nonisolated struct MapLink: Equatable, Sendable {
    let fuel: String?
    /// `MapDestination`'s tag: "fuel-<id>" or "ev-<id>".
    let station: String?

    init(fuel: String?, station: String? = nil) { /* private */ }

    init?(_ url: URL) { /* private */ }

    var url: URL? { /* private */ }
}
