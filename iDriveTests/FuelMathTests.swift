// Source code is private. This file shows only its types and signatures.

import Foundation
import Testing
@testable import iDrive

@Suite("Fuel maths")
struct FuelMathTests {
    @Test("Consumption is litres per 100 km")
    func consumption() { /* private */ }

    /// Plan example: P 120,000 km full · partial 20 l at 120,300 · C 32 l at 120,650 full.
    @Test("Full-to-full counts partial fills in between")
    func fullToFullWithPartial() throws { /* private */ }

    @Test("Partial fills before the first full tank are ignored")
    func partialBeforeFirstFull() { /* private */ }

    @Test("Entries are sorted by odometer, not by insertion order")
    func unsortedInput() { /* private */ }

    @Test("Averages are weighted by distance")
    func weightedAverages() throws { /* private */ }

    @Test("Spending is grouped per calendar month")
    func spendingPerMonth() { /* private */ }

    @Test("Percent change, plan example −11.1 %")
    func percentChange() { /* private */ }

    @Test("Any two of amount, price and total give the third")
    func deriveThird() { /* private */ }

    @Test("Consistency check allows receipt rounding")
    func consistency() { /* private */ }
}

@Suite("Consumption from the tank")
struct TankConsumptionTests {
    private func entry(_ dayOfMonth: Int, _ amount: Double, odometer: Int, level: Double?) -> FuelMath.Reading { /* private */ }

    /// 50 l tank: full at 10,000 km; ½ after adding 10 l at 10,400; full after 30 l at 10,800.
    @Test("A partial fill with a known level gives its own reading")
    func partialWithLevel() throws { /* private */ }

    @Test("Without a tank size, known partial levels fall back to full-to-full")
    func noCapacity() { /* private */ }

    @Test("An unknown partial level is carried to the next known level")
    func unknownLevel() { /* private */ }

    @Test("A gauge read too high (less than nothing used) is dropped")
    func impossible() { /* private */ }

    @Test("A battery charged to 80 % counts with the battery size")
    func battery() throws { /* private */ }

    @Test("The cost is what the used fuel cost at this interval's price")
    func cost() throws { /* private */ }

    @Test("Preview: the reading a new fill-up would give")
    func preview() throws { /* private */ }

    @Test("Tank before a full fill, estimated level after a partial, range per tank")
    func tankHelpers() { /* private */ }

    @Test("Tank levels read like a gauge, battery levels as percent")
    func labels() { /* private */ }
}
