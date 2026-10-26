// Source code is private. This file shows only its types and signatures.

import CoreLocation
import MapKit
import Testing
@testable import iDrive

@Suite("Map navigation and directions")
struct NavigationTests {
    @Test(
        "A pin's selection tag opens the same page as its list row",
        arguments: [
            MapDestination.station("41c5eac2-7a17-46d8-90fe-d0a8c56db5fc"),
            MapDestination.charger("mbw-319463"),
            MapDestination.charger("osm-node-2413225221")
        ]
    )
    func tagRoundTrip(destination: MapDestination) { /* private */ }

    @Test("Tags the map uses for pins map to destinations")
    func tagFormat() { /* private */ }

    @Test("Apple Maps item carries the station's name, position and address")
    func mapItem() { /* private */ }

    /// The strings follow the device locale ("13 Min." in German), so only the numbers are checked.
    @Test(
        "Driving estimate shows Apple's minutes and road distance",
        arguments: [
            (780.0, 6_800.0, "13", "6"), (3_900.0, 52_000.0, "5", "52")
        ] as [(Double, Double, String, String)]
    )
    func estimateText(seconds: Double, meters: Double, minutes: String, kilometres: String) { /* private */ }

    @Test("Without an address the map item still opens at the coordinate")
    func mapItemWithoutAddress() { /* private */ }
}
