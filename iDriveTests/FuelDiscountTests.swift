// Source code is private. This file shows only its types and signatures.

import Foundation
import Testing
@testable import iDrive

nonisolated private func station(_ id: String, brand: String, e10: Double?, diesel: Double? = nil) -> Station { /* private */ }

@Suite("Fuel-card discounts")
struct FuelDiscountTests {
    private let adac
    private let clubSmart

    @Test(
        "ADAC at Esso: 2 ct until 15 October, then 1 ct",
        arguments: [
            (day(2026, 10, 10), 2.0), (day(2026, 10, 15), 2.0), (day(2026, 10, 16), 1.0), (day(2027, 3, 1), 1.0)
        ]
    )
    func adacEsso(date: Date, cents: Double) { /* private */ }

    @Test("ADAC at Shell ends with 2026; Eni stations still branded Agip count")
    func adacShellAndAgip() { /* private */ }

    @Test("Discounts aren't added up: the biggest one counts")
    func biggestWins() { /* private */ }

    @Test("ClubSmart doesn't apply to V-Power, other brands or unbranded stations")
    func scope() { /* private */ }

    @Test("The station's price is the board price minus the discount; sorting follows it")
    func stationPrice() throws { /* private */ }

    @Test("Points programs are labelled as an approximation")
    func pointsLabel() throws { /* private */ }

    @Test(
        "A photo of the card finds the program, whatever the spelling",
        arguments: [
            (["ADAC Mitgliedskarte", "Max Mustermann"], ["adac"]),
            (["Shell", "Club Smart", "1234 5678"], ["shell-clubsmart"]),
            (["DeutschlandCard"], ["esso-deutschlandcard"]),
            (["Girocard", "Sparkasse"], [])
        ]
    )
    func recognise(lines: [String], ids: [String]) { /* private */ }

    @Test("A custom card for Eni also matches stations still called Agip")
    func customBrands() { /* private */ }
}
