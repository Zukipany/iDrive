// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// The car's photo, or its body style when there's none.
struct CarPicture: View {
    let car: WidgetSnapshot.Car

    var body: some View { /* private */ }
}

/// "2,07 €" a litre (or gallon) of fuel, "0,59 €" a kWh, in the driver's currency.
struct PriceLabel: View {
    let price: Double?
    let isElectric: Bool

    var body: some View { /* private */ }
}

/// "E10" with the fuel pump, or "AC" with the bolt.
struct FuelTag: View {
    let prices: WidgetSnapshot.Prices

    var body: some View { /* private */ }
}

/// One station in a list: name, distance (and fuel-card discount), price.
struct StationRow: View {
    let station: WidgetSnapshot.Prices.Station
    let prices: WidgetSnapshot.Prices
    let isCheapest: Bool

    var body: some View { /* private */ }

    private var details: String { /* private */ }
}

/// A price on the large widget's map, around its spot (the dot): standing on it,
/// hanging from it or beside it, wherever it covers no cheaper station's pin.
struct PricePin: View {
    let station: WidgetSnapshot.Prices.Station
    let isElectric: Bool
    /// 1 for the cheapest.
    let rank: Int
    var placement
    @Environment(\.widgetRenderingMode) private var renderingMode

    /// Tinted and clear Home Screens draw everything in one tint: a filled capsule would
    /// swallow its text, so there it's an outline with a faint fill.
    private var isTinted: Bool { /* private */ }

    var body: some View { /* private */ }

    private var price: String { /* private */ }

    private var alignment: Alignment { /* private */ }

    private var label: some View { /* private */ }
}

/// A station's spot on the map: alone when its pin would cover a cheaper one.
struct SpotDot: View {
    @Environment(\.widgetRenderingMode) private var renderingMode

    var body: some View { /* private */ }
}

/// "Prices from 11:42", or with "open iDrive to update" once they're stale.
struct PricesAge: View {
    let prices: WidgetSnapshot.Prices
    let isStale: Bool

    var body: some View { /* private */ }
}

extension WidgetSnapshot.Prices {
    /// When the app loaded them: "11:42".
    var time: String { /* private */ }
}

/// No prices yet, or no car: what to do in the app.
struct WidgetHint: View {
    let text: LocalizedStringKey
    let symbol: String

    var body: some View { /* private */ }
}
