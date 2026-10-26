// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData
import Testing
@testable import iDrive

@Suite("Fuel kinds")
struct FuelKindTests {
    @Test("Each fuel belongs to one kind")
    func kinds() { /* private */ }

    /// Stations only report E5, E10 and diesel to the MTS-K.
    @Test("Premium diesel has its own map chip, with an estimated price")
    func publicPrices() { /* private */ }
}

@Suite("Cars with several fuels")
struct MultiFuelVehicleTests {
    private func car(_ main: FuelType, extra: [FuelType], plugIn: Bool = false) -> Vehicle { /* private */ }

    @Test("E5 next to E10: the usual fuel first")
    func petrol() { /* private */ }

    @Test("Petrol and diesel never mix, nor do duplicates or electric")
    func sameKindOnly() { /* private */ }

    @Test("Diesel with premium diesel")
    func diesel() { /* private */ }

    @Test("Switching the main fuel to another kind drops the old extras")
    func switchKind() { /* private */ }

    @Test("A plug-in hybrid keeps both petrol fuels plus charging")
    func plugInHybrid() { /* private */ }

    @Test("A battery-electric car has no fuels")
    func electric() { /* private */ }
}

@Suite("Premium diesel on receipts")
struct PremiumDieselReceiptTests {
    @Test(
        "Brand names for premium diesel",
        arguments: [
            "Aral Ultimate Diesel", "Shell V-Power Diesel", "Excellium Diesel", "Esso Diesel MaxxMotion", "Diesel Premium"
        ]
    )
    func premium(product: String) { /* private */ }

    @Test("Regular diesel, including Shell's standard FuelSave", arguments: ["DIESEL", "Shell FuelSave Diesel", "Diesel B7"])
    func regular(product: String) { /* private */ }

    @Test("An advert further down doesn't make regular diesel premium")
    func advert() { /* private */ }
}

@Suite("Map with several fuels")
@MainActor
struct MapFuelTests {
    @Test("Pins use the car's usual fuel, not the first in the list")
    func preferredFuel() { /* private */ }
}

@Suite("Demo cars")
@MainActor
struct DemoCarTests {
    /// 8 Oct 2026, noon in Berlin: the day the October level was measured.
    private let now

    private func history(_ kind: DemoCars.Kind) -> (car: Vehicle, fillUps: [FillUp]) { /* private */ }

    @Test("Six months, ending today, plausible and physically possible", arguments: [DemoCars.Kind.petrol, .diesel])
    func plausible(kind: DemoCars.Kind) throws { /* private */ }

    @Test(
        "Consumption close to real-world figures",
        arguments: [
            (DemoCars.Kind.petrol, 5.8...7.5), (.diesel, 5.0...6.8)
        ]
    )
    func consumption(kind: DemoCars.Kind, range: ClosedRange<Double>) throws { /* private */ }

    @Test("Prices follow the ADAC monthly averages")
    func prices() throws { /* private */ }

    @Test("Monthly spending in a realistic range")
    func spending() { /* private */ }

    @Test("Adding twice makes it active once, without a duplicate")
    func add() throws { /* private */ }
}
