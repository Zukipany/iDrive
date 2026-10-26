// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData
import Testing
@testable import iDrive

@Suite("Spending balance")
struct SpendingSummaryTests {
    private let entries

    /// A finished month is compared with the whole previous month.
    private let afterOctober

    @Test("Finished month: total, whole previous month, and change")
    func totals() throws { /* private */ }

    /// Regression: on 10 October the app said "−40 % vs September" because it compared
    /// 10 days of October with all 30 days of September.
    @Test("Running month is compared with the same days of the previous month")
    func monthToDate() { /* private */ }

    @Test("Slices split by energy type, largest first, shares add up to 1")
    func slices() { /* private */ }

    @Test("Budget remaining and progress")
    func budget() { /* private */ }

    @Test("Empty month has no change and no slices")
    func emptyMonth() { /* private */ }
}

@Suite("Garage persistence")
@MainActor
struct GarageTests {
    private let container: ModelContainer
    private var context: ModelContext { /* private */ }

    init() throws { /* private */ }

    private func makeCar(_ name: String, active: Bool = false, createdAt: Date = .now) -> Vehicle { /* private */ }

    @Test("Only one car is active after activation")
    func activation() throws { /* private */ }

    @Test("Deleting a car deletes its fill-ups and hands 'active' to the next car")
    func cascadeDelete() throws { /* private */ }

    @Test("Energy types drive the default map filter")
    func energyTypes() { /* private */ }

    @Test("Sample data loads and gives a consumption close to the rated value")
    func sampleData() throws { /* private */ }
}
