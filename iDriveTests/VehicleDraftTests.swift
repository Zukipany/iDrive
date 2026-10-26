// Source code is private. This file shows only its types and signatures.

import Foundation
import Testing
@testable import iDrive

@Suite("Car form rules")
struct VehicleDraftTests {
    @Test("The last fuel can't be unticked, and the usual fuel moves to one still ticked")
    func toggleFuels() { /* private */ }

    @Test("Switching the engine starts over with its usual fuel; electric is never a plug-in hybrid")
    func setKind() { /* private */ }

    @Test("A car needs a name, a tank (or battery) and a rated consumption")
    func validity() { /* private */ }

    @Test("Typical values fill in energy, figures, body style and an empty name")
    func applyCatalogue() throws { /* private */ }

    @Test("A used suggestion stays closed until the car changes")
    func suggestionClosesAndReturns() { /* private */ }

    @Test("The VIN fills in make, model and year, and starts the generation over")
    func applyVIN() { /* private */ }

    @Test("Saving and opening a car again gives the same form")
    func roundTrip() { /* private */ }

    @Test("Any edit counts as a change, and undoing it doesn't")
    func snapshot() { /* private */ }
}
