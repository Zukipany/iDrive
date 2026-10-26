// Source code is private. This file shows only its types and signatures.

import Foundation

/// The "balance" for one month: what was spent, how it splits by energy type,
/// and how it compares with the month before.
nonisolated struct SpendingSummary: Equatable, Sendable {
    struct Slice: Identifiable, Equatable, Sendable {
        let fuel: FuelType
        let total: Double
        let share: Double
        var id: FuelType { /* private */ }
    }

    let month: DateInterval
    let total: Double
    /// Spending in the comparison window of the previous month.
    let previousTotal: Double
    /// True for the running month: it is compared with the same number of days of the
    /// previous month, so on 7 October you see 1–7 Oct vs 1–7 Sep, not vs all of September.
    let isMonthToDate: Bool
    let fillUpCount: Int
    /// Largest first. Shares add up to 1 when `total > 0`.
    let slices: [Slice]

    /// Percent vs the previous month; nil when the previous month had no spending.
    var change: Double? { /* private */ }

    init<E: FuelEntry>(
        entries: [E],
        monthContaining date: Date,
        now: Date = .now,
        calendar: Calendar = .current
    ) { /* private */ }

    func remaining(budget: Double) -> Double { /* private */ }

    /// 0...1 share of the budget used. 0 when no budget is set.
    func budgetProgress(budget: Double) -> Double { /* private */ }
}
