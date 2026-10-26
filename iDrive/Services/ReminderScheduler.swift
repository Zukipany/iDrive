// Source code is private. This file shows only its types and signatures.

import Foundation
import UserNotifications

/// Schedules a car's inspection and service reminders as local notifications. Asks for
/// permission the first time a reminder is set, not at launch.
enum ReminderScheduler {
    static func update(carID: String, carName: String, inspectionDue: Date?, serviceDue: Date?) async { /* private */ }

    static func cancel(carID: String) { /* private */ }
}

extension Vehicle {
    /// A stable identifier for notification requests.
    var reminderID: String { /* private */ }
}
