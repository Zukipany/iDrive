// Source code is private. This file shows only its types and signatures.

import Foundation

/// The figures the Garage card and the Home Screen widgets show for a car.
extension Vehicle {
    /// An inspection or service due within 60 days, or overdue.
    struct DueReminder: Equatable {
        let kind: ReminderPlan.Kind
        /// Negative when overdue.
        let days: Int
        /// "TÜV inspection in 21 days"
        let text: String
    }

    /// "6,1 l/100 km", or for a plug-in hybrid the share driven on electricity over the
    /// last 6 months ("≈ 71 %"): its litres and kWh mean little on their own.
    var averageText: String? { /* private */ }

    /// km on a full tank (or battery) at the measured average consumption. A plug-in
    /// hybrid's litres over all km would count its electric km too (it showed 2,000 km per
    /// tank): its petrol use while on petrol, or the rated figure, instead.
    var rangeKm: Int? { /* private */ }

    /// The higher of the log's last reading and what the car itself last reported (Smartcar).
    @MainActor var currentOdometer: Int? { /* private */ }

    /// The car's own range when it reported in the last day; else a full tank at the measured use.
    @MainActor var currentRangeKm: Int? { /* private */ }

    /// Spent on fuel and charging in the month containing `date`.
    func spent(inMonthOf date: Date = .now) -> Double { /* private */ }

    /// Inspection, then service, when due within 60 days or overdue.
    var dueSoon: [DueReminder] { /* private */ }

    /// "6,1 l/100 km" or "17,2 kWh/100 km", in the driver's units.
    func consumptionText(_ value: Double) -> String { /* private */ }
}
