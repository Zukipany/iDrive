// Source code is private. This file shows only its types and signatures.

import Observation

/// Requests from outside the screens (Siri, Shortcuts, the widget) for the app to open a
/// task. The screen that handles a request clears it.
@Observable
final class AppRouter {
    static let shared

    enum Request: Equatable {
        case addFillUp
        case scanReceipt
        /// Open the map with this fuel and the station list.
        case findFuel(FuelType)
        /// Open a station's (or charger's) page on the map, from a widget. The tag is
        /// `MapDestination`'s: "fuel-<id>" or "ev-<id>".
        case openStation(tag: String, fuel: FuelType?)
    }

    var pending: Request?
}
