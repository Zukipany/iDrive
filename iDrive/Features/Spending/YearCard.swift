// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Spent so far this year, the forecast for the whole year, and the cost per km.
struct YearCard: View {
    let forecast: YearForecast
    let costPerKm: Double?
    /// This year's fill-ups against the average price nearby.
    let savings: Savings?

    var body: some View { /* private */ }

    @ViewBuilder private var figures: some View { /* private */ }

    private func figure(_ title: LocalizedStringKey, _ value: String) -> some View { /* private */ }
}

extension FillUpExport {
    /// Every fill-up of the car, with the consumption each one showed.
    init(vehicle: Vehicle) { /* private */ }
}
