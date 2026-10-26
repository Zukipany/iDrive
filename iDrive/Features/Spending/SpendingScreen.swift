// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftData
import SwiftUI

/// Revolut-style "balance" for fuel: one big number for the month, a ring by energy
/// type (or budget used vs left), the change vs last month, consumption, and below it
/// every fill-up like a bank statement. Adding fill-ups (scan or manual) lives here too.
/// All cards are content → standard backgrounds, no Liquid Glass.
struct SpendingScreen: View {
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<Vehicle> { }) private var activeVehicles: [Vehicle]
    @AppStorage("monthlyBudget") private var budget
    @AppStorage(SavingsNotifier.enabledKey) private var sendsSavingsSummary

    @State private var monthOffset
    @State private var showsBudgetEditor
    @State private var budgetInput: Double?
    @State private var capture
    /// The visible height of the page and the ring card's height, to size the log box.
    @State private var visibleHeight
    @State private var cardHeight

    private var vehicle: Vehicle? { /* private */ }

    /// Fill-ups grouped by month, newest first.
    private var months: [(month: Date, items: [FillUp])] { /* private */ }

    private var month: Date { /* private */ }

    var body: some View { /* private */ }

    /// The month's spending, or what to do when there's no car or fill-up yet.
    private var screenContent: some View { /* private */ }
}

extension SpendingScreen {
    /// The month's ring, the log right under it (scrolling the log moves the ring), then
    /// the charts; the year comes last, as it's the least looked-at.
    private func content(_ vehicle: Vehicle) -> some View { /* private */ }

    private func savings(of vehicle: Vehicle, in month: Date) -> Savings? { /* private */ }

    /// The log scrolled to another month: the ring follows.
    private func show(_ month: Date) { /* private */ }

    private func delete(_ fillUp: FillUp) { /* private */ }
}
