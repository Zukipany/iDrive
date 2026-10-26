// Source code is private. This file shows only its types and signatures.

import AppIntents

/// "Start Recording a Drive": for a Shortcuts automation ("When CarPlay connects"), so drives
/// are recorded without opening iDrive first. It opens iDrive for a moment: iOS lets an app
/// start following the location only while it's on screen; the drive then keeps recording
/// with the screen locked.
struct StartDriveIntent: AppIntent {
    static let title: LocalizedStringResource
    static let description
    static let supportedModes: IntentModes

    @MainActor func perform() async throws -> some IntentResult & ProvidesDialog { /* private */ }
}

/// "End the Drive": for the automation "When CarPlay disconnects". Needs no screen.
struct EndDriveIntent: AppIntent {
    static let title: LocalizedStringResource
    static let description
    static let supportedModes: IntentModes

    @MainActor func perform() async throws -> some IntentResult { /* private */ }
}
