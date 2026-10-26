// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftUI
import Testing
@testable import iDrive

@Suite("Location button: show me, heading, north up")
struct LocateCycleTests {
    @Test("The map's position names the step the button is on")
    func states() { /* private */ }

    @Test("Each tap moves one step on, as in Apple Maps")
    func cycle() { /* private */ }

    @Test("Zoomed out while following, a tap zooms in again first")
    func zoomedOut() { /* private */ }
}
