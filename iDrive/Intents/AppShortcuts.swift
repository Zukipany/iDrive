// Source code is private. This file shows only its types and signatures.

import AppIntents

/// "Log a fill-up": opens the fill-up form for the active car.
struct LogFillUpIntent: AppIntent {
    static let title: LocalizedStringResource
    static let description
    static let supportedModes: IntentModes

    @MainActor func perform() async throws -> some IntentResult { /* private */ }
}

/// "Scan a receipt": opens the receipt scanner.
struct ScanReceiptIntent: AppIntent {
    static let title: LocalizedStringResource
    static let description
    static let supportedModes: IntentModes

    @MainActor func perform() async throws -> some IntentResult { /* private */ }
}

/// The fuels with public prices, for "Find cheap …".
enum PricedFuel: String, AppEnum {
    case e5, e10, diesel

    static let typeDisplayRepresentation: TypeDisplayRepresentation
    static let caseDisplayRepresentations: [PricedFuel: DisplayRepresentation]

    var fuel: FuelType { /* private */ }
}

/// "Find cheap diesel": opens the map with that fuel and the stations sorted by price.
struct FindCheapFuelIntent: AppIntent {
    static let title: LocalizedStringResource
    static let description
    static let supportedModes: IntentModes

    @Parameter(title: "Fuel", default: .e10)
    var fuel: PricedFuel

    @MainActor func perform() async throws -> some IntentResult { /* private */ }
}

/// Phrases for Siri and the Shortcuts app; they work without any setup.
struct IDriveShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] { /* private */ }
}
