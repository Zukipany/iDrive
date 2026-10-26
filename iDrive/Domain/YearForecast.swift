// Source code is private. This file shows only its types and signatures.

import Foundation

/// Spending so far this calendar year and where it's heading: what was spent per day so
/// far, over the whole year. Needs a few weeks of data to mean something.
nonisolated struct YearForecast: Equatable, Sendable {
    let year: Int
    let spentSoFar: Double
    /// Nil until 30 days of the year have passed or no fill-up was logged this year.
    let forecast: Double?
    let fillUpCount: Int

    init(entries: [some FuelEntry], now: Date = .now, calendar: Calendar = .current) { /* private */ }
}
