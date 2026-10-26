// Source code is private. This file shows only its types and signatures.

import OSLog
import SwiftData

/// Diagnostics kept in the app, readable in Console.app (subsystem com.christo.idrive).
/// Never logs keys or personal data: no coordinates, no receipt text.
nonisolated enum AppLog {
    static let network
    static let storage
    static let scanning
    static let intelligence
    static let reminders
}

extension ModelContext {
    /// Saves, and logs a failure instead of silently dropping it. Returns whether it worked.
    @discardableResult
    func saveLogged(_ what: StaticString = "changes") -> Bool { /* private */ }
}
