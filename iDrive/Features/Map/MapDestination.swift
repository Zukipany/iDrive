// Source code is private. This file shows only its types and signatures.

import Foundation

/// A detail page in the map sheet. Also links a map pin's selection tag to its page,
/// so tapping a pin and tapping a list row open the same screen.
enum MapDestination: Hashable {
    case station(Station.ID)
    case charger(ChargePoint.ID)

    /// The tag used on the map annotation: "fuel-<id>" or "ev-<id>".
    var selectionTag: String { /* private */ }

    init?(selectionTag tag: String) { /* private */ }
}
