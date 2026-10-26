// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftUI

/// The trip on the map: the route, the stops still ahead and the destination.
struct TripMapContent: MapContent {
    let trip: ActiveTrip

    var body: some MapContent { /* private */ }
}
