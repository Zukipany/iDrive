// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import Testing
@testable import iDrive

@Suite("Premium diesel availability")
struct PremiumDieselTests {
    @Test(
        "Brands that sell it nearly everywhere count without OpenStreetMap",
        arguments: [
            ("ARAL", "Aral Ultimate Diesel"), ("Shell", "Shell V-Power Diesel"), ("TotalEnergies", "TotalEnergies Excellium Diesel")
        ]
    )
    func brand(brand: String, product: String) { /* private */ }

    @Test("Esso (selected stations only), AVIA, Eni and JET need OpenStreetMap", arguments: ["ESSO", "AVIA", "AGIP ENI", "JET", ""])
    func needsConfirmation(brand: String) { /* private */ }

    @Test("OpenStreetMap confirms a station; the product is named when the brand is known")
    func confirmed() { /* private */ }

    @Test("A station tagged no never counts, even for Aral")
    func taggedNo() { /* private */ }

    @Test("Estimated price: diesel + up to 20 ct; nothing without a diesel price or availability")
    func price() { /* private */ }

    @Test("OSM tags match the nearest station within 80 m")
    func matching() { /* private */ }

    @Test("Overpass answer: nodes and ways, yes and no; other values skipped")
    func decode() throws { /* private */ }
}

@Suite("Map with premium diesel")
@MainActor
struct PremiumDieselMapTests {
    private let munich

    /// Two Aral (one tagged "no" in OSM), JET, Esso (tagged "yes"), AVIA (untagged).
    nonisolated private static let stationsJSON

    nonisolated private static let tagsJSON

    private func model(osmWorks: Bool = true) -> MapViewModel { /* private */ }

    @Test("Only premium on: only stations known to sell it, cheapest estimate first")
    func premiumOnly() async { /* private */ }

    @Test("Diesel and premium on: every station shows, both prices compared")
    func dieselAndPremium() async { /* private */ }

    @Test("OpenStreetMap down: the brand rule still finds the Aral stations")
    func osmDown() async { /* private */ }

    @Test("Premium off: OpenStreetMap isn't asked")
    func noPremium() async { /* private */ }
}
