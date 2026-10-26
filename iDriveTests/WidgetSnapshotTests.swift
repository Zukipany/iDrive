// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import Testing
@testable import iDrive

@Suite("Home Screen widgets")
@MainActor
struct WidgetSnapshotTests {
    private let marienplatz

    private func station(_ id: String, e10: Double?, diesel: Double? = 1.65, open: Bool = true, dist: Double = 1) -> Station { /* private */ }

    private func charger(_ id: String, fast: Bool, price: Double?, km: Double) -> ChargePoint { /* private */ }

    @Test("The car's fuel: open stations with a price only, cheapest first, at most 5, by map tag")
    func stations() throws { /* private */ }

    @Test("Chargers of the car's kind: priced cheapest first, then the nearest without a price")
    func chargers() throws { /* private */ }

    @Test("Saving against the average in cents, and prices turn stale after 2 hours")
    func savingAndAge() throws { /* private */ }

    @Test("Premium diesel drivers see diesel prices; the others their own fuel")
    func priceFuel() { /* private */ }

    @Test("Links: the map with a fuel, or one station's page; old links still work")
    func links() throws { /* private */ }

    @Test("Each pin takes the first free place around its spot; later ones become dots")
    func pins() { /* private */ }

    @Test("The three cheapest always get a price, even on one spot")
    func guaranteedPins() { /* private */ }

    @Test("The car: its figures, the nearest reminder, the body style without a photo")
    func car() throws { /* private */ }
}
