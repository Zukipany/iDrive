// Source code is private. This file shows only its types and signatures.

import Foundation

extension DemoCars {
    /// The X5 xDrive50e over 6 months: the commute runs on the battery, charged at home most
    /// nights (the wallbox meter counts the charging losses too); long drives use Super E5
    /// once the battery is empty; on holiday it charges at public stations.
    static func hybridHistory(car: Vehicle, now: Date, calendar: Calendar = .current) -> [FillUp] { /* private */ }

    private struct HybridEntry {
        let date: Date
        let amount: Double
        let price: Double
        let odometer: Int
        let isFull: Bool
        let fuel: FuelType
        let station: String
        let levelAfter: Double?
        /// The average nearby to compare with; nil for the home wallbox.
        let average: Double?
    }

    private static let battery , tank
    private static let homePrice
    /// Public AC charging around Munich and at the holiday spots, and its average nearby.
    private static let publicAC

    private static func simulateHybrid(now: Date, seed: UInt64, calendar: Calendar) -> [HybridEntry] { /* private */ }

    /// A full tank of Super E5: in town in the evening, or at the motorway on a long drive.
    private static func petrolFill(
        on day: Date,
        longDrive: Bool,
        from fuel: Double,
        odometer: Int,
        random: inout SeededRandom,
        calendar: Calendar
    ) -> HybridEntry { /* private */ }

    /// Overnight at home to 100 % (the meter adds about 8 % losses) when below 55 %; on
    /// holiday an hour or two at a public charger, to about 80 %, when below 40 %.
    private static func charging(
        on day: Date,
        holidayKm: Double?,
        from charge: Double,
        odometer: Int,
        random: inout SeededRandom,
        calendar: Calendar
    ) -> (entry: HybridEntry, chargeAfter: Double)? { /* private */ }
}
