// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

/// Realistic demo data for previews, screenshots and the DEBUG "Load Sample Data" button.
/// Values are deterministic so previews look the same every time.
enum SampleData {
    @MainActor static let previewContainer: ModelContainer

    @MainActor static func insert(into context: ModelContext, now: Date = .now) { /* private */ }

    /// About 6 months of E10, partly partial fills.
    @MainActor private static func insertPetrolHistory(for car: Vehicle, now: Date, into context: ModelContext) { /* private */ }

    /// Home and fast charging, every 6 days.
    @MainActor private static func insertElectricHistory(for car: Vehicle, now: Date, into context: ModelContext) { /* private */ }

    /// Mostly charged at home, petrol for longer trips.
    @MainActor private static func insertHybridHistory(for car: Vehicle, now: Date, into context: ModelContext) { /* private */ }
}
