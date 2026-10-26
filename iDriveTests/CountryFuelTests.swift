// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import Testing
@testable import iDrive

/// Decoding of the Austrian, French and Spanish price APIs, from trimmed real responses
/// (14 Oct 2026), and the map's routing by country.
@Suite("Fuel prices outside Germany")
@MainActor
struct CountryFuelTests {
    nonisolated private final class BundleToken {}

    private let vienna
    private let paris
    private let madrid

    private static func fixture(_ name: String) throws -> Data { /* private */ }

    @Test("Countries map to their source; others have none")
    func sources() { /* private */ }

    @Test("Austria: the diesel and Super lists merge into one station each")
    func austria() throws { /* private */ }

    @Test("France: prices older than 30 days are dropped, E10 and SP95 kept apart")
    func france() throws { /* private */ }

    @Test("France: the request searches around the point, nearest first")
    func franceRequest() throws { /* private */ }

    @Test("Spain: decimal commas, real premium diesel, only stations in range")
    func spain() throws { /* private */ }

    @Test("Spain: the province is the postal code's first two digits")
    func provinces() { /* private */ }

    @Test("German fuel cards don't apply abroad")
    func noCardsAbroad() throws { /* private */ }

    @Test("The map asks Spain's service in Spain and says when a country has no prices")
    func routing() async throws { /* private */ }
}

@Suite("Chargers in the US and Canada")
struct NRELChargerTests {
    nonisolated private final class BundleToken {}

    private let sanFrancisco

    private func fixture() throws -> Data { /* private */ }

    @Test("Power per connector from the charging units; dollar prices stay text")
    func decode() throws { /* private */ }

    @Test("The key goes in a header; DEMO_KEY when none is set")
    func request() throws { /* private */ }

    @Test("In the US the service asks NREL and never MobiData BW")
    func routing() async throws { /* private */ }
}
