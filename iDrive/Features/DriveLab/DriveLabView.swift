// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// The Drive Lab (the Garage's magic wand): the recorder live, which car the iPhone is in, the
/// consumption engine for the active car, and every recorded drive with its data. For the
/// developer, not drivers: debug builds, or the `developerPanel` setting. English on purpose.
struct DriveLabView: View {
    @Environment(\.dismiss) private var dismiss
    @Query(filter: #Predicate<Vehicle> { }) private var activeVehicles: [Vehicle]
    @Query(sort: [SortDescriptor(\Vehicle.sortIndex)]) private var vehicles: [Vehicle]
    private var store
    @State private var engine: EngineReport?
    /// The day's temperature per drive, from Open-Meteo, for the estimates.
    @State private var temperatures: [Ride.ID: Double]
    /// Drives of one car; nil for all.
    @State private var carFilter: String?

    /// Debug builds always; release builds with `-developerPanel YES`.
    static var isAvailable: Bool { /* private */ }

    private var activeCar: Vehicle? { /* private */ }

    private var shownRides: [Ride] { /* private */ }

    var body: some View { /* private */ }

    private struct EngineKey: Equatable {
        let car: String?
        let fillUps: Int
        let rides: Int
    }

    // MARK: Drives

    @ViewBuilder private var drives: some View { /* private */ }

    /// One chip per car that has drives, to see each car's own data.
    private var carChips: some View { /* private */ }

    private func chip(_ title: String, isOn: Bool, action: @escaping () -> Void) -> some View { /* private */ }

    private func totals(_ rides: [Ride]) -> some View { /* private */ }

    /// "23 min", "1 h 20 min"
    static func duration(_ seconds: TimeInterval) -> String { /* private */ }

    private func days(_ rides: [Ride]) -> [(day: Date, rides: [Ride])] { /* private */ }

    private func estimate(_ ride: Ride) -> DriveEstimate? { /* private */ }

    /// Each drive's day, at its start: one Open-Meteo request per area for all of them.
    private func loadTemperatures() async { /* private */ }
}

/// One drive in the list: its shape, the figures, the road mix and the car.
struct DriveRow: View {
    let ride: Ride
    let estimate: DriveEstimate?
    let electric: Bool

    var body: some View { /* private */ }
}
