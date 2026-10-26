// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import SwiftData
import Testing
@testable import iDrive

@Suite("Savings edge cases")
struct SavingsEdgeCaseTests {
    @Test("A fill-up at midnight on the 1st belongs to the new month only")
    func midnightOnTheFirst() throws { /* private */ }

    @Test("A price far from the average (another city or country) isn't compared")
    func otherPlace() { /* private */ }

    @Test("Home charging without an average and a zero price never count")
    func nothingToCompare() { /* private */ }
}

@Suite("Station data edge cases")
struct StationDataEdgeCaseTests {
    private func station(street: String, number: String?, place: String) -> Station { /* private */ }

    @Test("A price of 0 is a reporting error: missing, never the cheapest pin")
    func zeroPrice() throws { /* private */ }

    @Test("Addresses skip the parts a source leaves empty")
    func addresses() { /* private */ }

    @Test("A discount as big as the price is ignored, not free fuel")
    func hugeDiscount() { /* private */ }

    @Test("Search ignores case and accents")
    func search() { /* private */ }
}

@Suite("Export edge cases")
struct ExportEdgeCaseTests {
    private func export(station: String?, carName: String = "Golf") -> FillUpExport { /* private */ }

    @Test("A station name a spreadsheet would run as a formula stays text")
    func formulaInjection() { /* private */ }

    @Test("Separators, quotes and line breaks in a name are quoted")
    func quoting() { /* private */ }

    @Test("File names keep umlauts readable and never end up empty")
    func fileNames() { /* private */ }
}

@Suite("Garage edge cases")
@MainActor
struct GarageEdgeCaseTests {
    private func container() throws -> ModelContainer { /* private */ }

    @Test("Deleting the active car hands over to the main car, not the oldest")
    func deleteActive() throws { /* private */ }

    @Test("Deleting the last car leaves an empty Garage, nothing active")
    func deleteLast() throws { /* private */ }
}

/// Counts reverse-geocoder calls.
@MainActor
private final class LookupCounter {
    var calls
    var fails
}

@Suite("Country lookups and caching")
@MainActor
struct CountryCachingTests {
    nonisolated private final class BundleToken {}

    private let vienna

    @Test("One lookup per 2 km; offline, the last country found")
    func locatorCache() async { /* private */ }

    @Test("Austria: cached for 5 minutes; offline, older prices marked as such")
    func staleFallback() async throws { /* private */ }

    @Test("France: the query's whole km are trimmed back to the map's radius")
    func franceRadius() async throws { /* private */ }

    @Test("Spain without a postal code says why instead of showing nothing")
    func spainWithoutProvince() async { /* private */ }

    @Test("Austria's cheapest-only list isn't used as the average for savings")
    func austriaNotRecorded() async throws { /* private */ }

    private func fixture(_ name: String) throws -> Data { /* private */ }
}

/// A network that works until it's switched off.
private actor FlakyNetwork {
    private(set) var calls
    private var offline

    func goOffline() { /* private */ }

    func respond(_ data: Data) throws -> Data { /* private */ }
}

/// Mutable time for tests. Only changed between awaited calls, never concurrently.
nonisolated private final class MutableClock: @unchecked Sendable {
    var now
}
