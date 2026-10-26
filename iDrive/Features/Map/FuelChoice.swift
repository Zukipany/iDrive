// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

extension View {
    /// Starts the map's fuel chips on the car's fuels, and keeps a choice made on them until
    /// another car becomes active or it has been left alone for 5 minutes. `onCarChange` runs
    /// after the reset when the active car (or its fuels) changes.
    func fuelChoice(
        model: MapViewModel,
        mode: Binding<FuelFilterBar.Mode>,
        vehicle: Vehicle?,
        carFuels: [FuelType],
        onCarChange: @escaping () -> Void
    ) -> some View { /* private */ }
}

private struct FuelChoice: ViewModifier {
    /// The fuels picked on the chips go back to the car's after this long untouched.
    static let resetDelay: Duration

    let model: MapViewModel
    @Binding var mode: FuelFilterBar.Mode
    let vehicle: Vehicle?
    /// The car's fuels the map offers here.
    let carFuels: [FuelType]
    let onCarChange: () -> Void

    /// What the chips start with: the car's fuels.
    private var defaultFuels: Set<FuelType> { /* private */ }

    /// Changes when another car becomes active, or the active one's fuels change.
    private var carIdentity: CarIdentity { /* private */ }

    func body(content: Content) -> some View { /* private */ }

    /// The car's fuels on the chips again, and the car's row instead of every fuel.
    private func reset() { /* private */ }
}

private struct CarIdentity: Equatable {
    let id: PersistentIdentifier?
    let fuels: [FuelType]
}
