// Source code is private. This file shows only its types and signatures.

import Foundation

/// When to remind about a car's main inspection (TÜV/HU) and service: 30 days and 7 days
/// before, at 9:00. A date set less than a week ahead gets one reminder the next 9:00
/// instead, so it's never silent. Pure, so it's easy to test; `ReminderScheduler` hands it
/// to the system.
nonisolated enum ReminderPlan {
    enum Kind: String, CaseIterable, Sendable {
        case inspection, service

        var label: String { /* private */ }
    }

    struct Notice: Equatable, Sendable {
        let identifier: String
        let fireDate: Date
        let title: String
        let body: String
    }

    static let daysBefore

    /// Every identifier a car's reminders can have, to replace or cancel them all.
    static func identifiers(carID: String) -> [String] { /* private */ }

    /// The notices still in the future for one due date.
    static func notices(
        carID: String,
        carName: String,
        kind: Kind,
        due: Date,
        now: Date = .now,
        calendar: Calendar = .current
    ) -> [Notice] { /* private */ }

    /// 9:00 today if that's still ahead, otherwise tomorrow.
    private static func nextMorning(after now: Date, calendar: Calendar) -> Date? { /* private */ }

    private static func plannedNotices(
        carID: String,
        carName: String,
        kind: Kind,
        due: Date,
        now: Date,
        calendar: Calendar
    ) -> [Notice] { /* private */ }

    /// Whole days from today until `due`; negative when overdue.
    static func daysUntil(_ due: Date, now: Date = .now, calendar: Calendar = .current) -> Int { /* private */ }
}
