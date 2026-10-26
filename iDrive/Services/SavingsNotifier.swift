// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData
import UserNotifications

/// A summary on the 1st of the next month at 10:00 of what the month's fill-ups saved
/// against the average price nearby. Rescheduled whenever a fill-up is saved or deleted,
/// so it always has the latest amount; only sent when something was saved.
enum SavingsNotifier {
    /// UserDefaults switch, shown in the Spending menu.
    static let enabledKey
    /// Below this it isn't worth a notification.
    nonisolated static let minimumAmount

    nonisolated struct Notice: Equatable, Sendable {
        let identifier: String
        let fireDate: Date
        let title: String
        let body: String
    }

    /// The notice for the month containing `now`, or nil when there's nothing to report.
    nonisolated static func notice(for entries: [some FuelEntry], now: Date = .now, calendar: Calendar = .current) -> Notice? { /* private */ }

    nonisolated static func identifier(for monthStart: Date, calendar: Calendar = .current) -> String { /* private */ }

    /// Recomputes this month's summary from all cars' fill-ups and schedules it.
    static func update(in context: ModelContext, now: Date = .now) { /* private */ }
}
