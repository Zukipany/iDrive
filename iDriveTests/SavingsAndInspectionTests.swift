// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData
import Testing
@testable import iDrive

@Suite("Savings against the average nearby")
struct SavingsTests {
    @Test("Saved = (average − paid) × amount; fill-ups without an average don't count")
    func savings() throws { /* private */ }

    @Test("Nothing to compare with gives no savings, not zero")
    func noData() { /* private */ }

    @Test("The monthly summary fires on the 1st at 10:00, only when something was saved")
    func monthlyNotice() throws { /* private */ }
}

@Suite("Average prices nearby")
struct NearbyPricesTests {
    nonisolated private static func station(_ id: String, diesel: Double, open: Bool = true) -> Station { /* private */ }

    private func defaults() throws -> UserDefaults { /* private */ }

    @Test("Averages the board prices of open stations, and keeps them between launches")
    func recordsAndPersists() throws { /* private */ }

    @Test("Older than 12 hours isn't used; fewer than 3 prices don't make an average")
    func freshnessAndMinimum() throws { /* private */ }
}

@Suite("TÜV inspection rules")
struct InspectionGuideTests {
    @Test(
        "Sticker colours repeat every six years",
        arguments: [
            (2025, InspectionGuide.StickerColor.orange), (2026, .blue), (2027, .yellow), (2028, .brown),
            (2029, .pink), (2030, .green), (2031, .orange), (2024, .green)
        ]
    )
    func stickerColour(year: Int, colour: InspectionGuide.StickerColor) { /* private */ }

    @Test(
        "Fines by months late",
        arguments: [(0, 0, false), (1, 0, false), (2, 15, false), (3, 15, false), (4, 25, false), (7, 25, false), (8, 60, true), (9, 60, true)]
    )
    func fines(months: Int, fine: Int, point: Bool) { /* private */ }

    @Test("Due by the last day of the sticker month; next one 24 months after passing")
    func dueDates() throws { /* private */ }

    @Test("Late only after the due month has ended")
    func monthsOverdue() throws { /* private */ }
}

@Suite("Log and car versions")
struct LogAndVersionTests {
    @Test("The month whose header reached the top of the log box")
    func logMonth() { /* private */ }

    @Test("Exact versions carry their own tank, battery and consumption")
    func catalogueVersions() throws { /* private */ }

    @Test("Picking a version fills in its values and names it")
    func versionApplies() throws { /* private */ }
}

@Suite("Plug-in hybrid demo and the main car")
@MainActor
struct HybridDemoAndMainCarTests {
    @Test("The X5 charges at home most nights and fills up with E5 on long drives")
    func hybridHistory() throws { /* private */ }

    @Test("Reopening the app makes the top car of the Garage active again")
    func mainCarOnLaunch() throws { /* private */ }

    private func checkMainCar(in context: ModelContext) throws { /* private */ }
}
