// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData
import UIKit

/// Three demo cars with 6 months of believable fill-ups, for reviewing the charts with
/// real-looking numbers. Prices follow the real ADAC monthly averages for 2026, so the
/// April peak, the June dip and the September record show up in the spending.
///
/// What's real: the monthly price levels (ADAC), today's Munich level (Tankerkönig,
/// 8 Oct 2026), the E5 surcharge (6 ct, the spread seen at Munich stations that day) and
/// the stations' names. What's modelled: each station's offset from the average, motorway
/// surcharges, the driving (commuting, weekends, a summer trip) and the consumption.
enum DemoCars {
    enum Kind: CaseIterable, Identifiable {
        /// Golf that usually takes E10 and sometimes E5.
        case petrol
        /// 320d saloon that takes diesel and, before long trips, premium diesel.
        case diesel
        /// X5 xDrive50e: charged at home, Super E5 on long drives.
        case plugInHybrid

        var id: Self { /* private */ }

        var name: String { /* private */ }

        var menuTitle: String { /* private */ }

        /// The car's photo in the asset catalogue (Wikimedia Commons, see docs/CREDITS.md).
        var photoAsset: String { /* private */ }
    }

    /// ADAC monthly averages 2026 in €/l (E10, diesel). October is the average of
    /// Munich stations on 8 Oct 2026 via Tankerkönig (the month wasn't over yet).
    static let monthlyAverages: [Int: (e10: Double, diesel: Double)]
    static let e5Surcharge
    /// Aral Ultimate Diesel, Shell V-Power Diesel and the like cost about 20 ct more.
    static let premiumDieselSurcharge

    /// Adds the demo car (or finds it if it's already there), makes it active and returns it.
    @discardableResult @MainActor
    static func add(_ kind: Kind, to context: ModelContext, now: Date = .now) throws -> Vehicle { /* private */ }

    /// The bundled photo: already cut out and cropped to the car (tools/cutout.swift), so
    /// nothing runs in the background after the car is saved.
    @MainActor private static func addPhoto(_ kind: Kind, to car: Vehicle, in context: ModelContext) { /* private */ }

    // MARK: Prices

    /// Average price on a day: the month's ADAC average, eased into the next month over
    /// the 5 days around the change so prices don't jump on the 1st. Blending only at the
    /// edges keeps each month's mean at the real average (blending across the whole month
    /// pulled June diesel 9 ct too high).
    static func averagePrice(_ fuel: FuelType, on date: Date, calendar: Calendar = .current) -> Double { /* private */ }

    private static func level(_ month: Int) -> (e10: Double, diesel: Double) { /* private */ }

    private static func blend(
        _ a: (e10: Double, diesel: Double),
        _ b: (e10: Double, diesel: Double),
        weight: Double
    ) -> (e10: Double, diesel: Double) { /* private */ }

    /// Munich stations (names from Tankerkönig) and how far they usually sit from the
    /// average. The motorway station is the expensive one you stop at on a trip.
    static let cityStations: [(name: String, offset: Double)]
    static let motorwayStation

    // MARK: Cars and driving

    private struct Profile {
        let commuteKm: Double
        let weekendKm: Double
        /// l/100 km around town by month, and on the motorway.
        let townConsumption: [Int: Double]
        let motorwayConsumption: Double
        let capacity: Double
        let usual: FuelType
        let other: FuelType
        let startOdometer: Int
    }

    private static func profile(_ kind: Kind) -> Profile { /* private */ }

    /// Simulates 183 days of driving. Refuels when the tank runs low:
    /// usually a full tank in town in the evening, now and then a cheap partial top-up,
    /// and on a long drive a full tank at a motorway station. The other fuel (E5, premium
    /// diesel) is used on long drives and about every fourth time.
    static func history(for kind: Kind, car: Vehicle, now: Date, calendar: Calendar = .current) -> [FillUp] { /* private */ }

    private struct Entry {
        let date: Date
        let amount: Double
        let price: Double
        let total: Double
        let odometer: Int
        let isFull: Bool
        let fuel: FuelType
        let station: String
        /// Partial fills: the gauge after filling, in eighths as the driver would read it.
        let gaugeAfter: Double?
    }

    private static func simulate(_ kind: Kind, now: Date, seed: UInt64, calendar: Calendar) -> [Entry] { /* private */ }

    /// Holiday driving, nil on normal days: Pentecost weekend at Lake Garda (late May) and
    /// two weeks at the North Sea in August, with short drives while there.
    static func holidayKm(on day: Date, calendar: Calendar) -> Double? { /* private */ }
}

/// Repeatable "random" numbers (SplitMix64), so the demo looks the same every time.
struct SeededRandom {
    private var state: UInt64

    init(seed: UInt64) { /* private */ }

    mutating func nextUInt() -> UInt64 { /* private */ }

    mutating func next(_ low: Double, _ high: Double) -> Double { /* private */ }

    mutating func int(_ low: Int, _ high: Int) -> Int { /* private */ }

    mutating func index(_ count: Int) -> Int { /* private */ }
}
