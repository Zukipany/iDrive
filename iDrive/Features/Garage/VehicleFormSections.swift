// Source code is private. This file shows only its types and signatures.

import SwiftUI

struct CarSection: View {
    @Bindable var draft: VehicleDraft
    private let catalog

    var body: some View { /* private */ }

    /// "Golf 8" when a generation is chosen, else the model name.
    private var modelLabel: String { /* private */ }

    /// The chosen generation's years, or 1980 to next year, newest first.
    private var yearChoices: [Int] { /* private */ }
}

struct EnergySection: View {
    @Bindable var draft: VehicleDraft

    var body: some View { /* private */ }

    /// A tickable fuel. The last ticked one can't be unticked: a car needs a fuel.
    private func fuelRow(_ fuel: FuelType) -> some View { /* private */ }
}

/// A labelled number with its unit, typed on the decimal keypad.
struct NumberRow: View {
    let title: LocalizedStringKey
    @Binding var value: Double?
    /// Shown in the driver's units (gallons, mpg …); stored as before.
    var conversion
    var unit

    var body: some View { /* private */ }

    private var shown: Binding<Double?> { /* private */ }
}

struct RemindersSection: View {
    @Bindable var draft: VehicleDraft

    var body: some View { /* private */ }
}

/// A switch that reveals a date picker; switching it on suggests a typical interval.
struct ReminderRow: View {
    let title: LocalizedStringKey
    @Binding var date: Date?
    let defaultMonths: Int

    var body: some View { /* private */ }

    private var isOn: Binding<Bool> { /* private */ }
}
