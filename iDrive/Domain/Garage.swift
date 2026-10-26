// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

/// Garage rules that touch several vehicles at once.
enum Garage {
    /// The order after moving `sources` in front of `before` (nil: to the end). Pure, so
    /// it's easy to test; `reorder` applies it to the cars.
    nonisolated static func reordered<ID: Equatable>(_ ids: [ID], moving sources: [ID], before: ID?) -> [ID] { /* private */ }

    /// Saves a drag-and-drop reorder of the Garage as each car's `sortIndex`.
    static func reorder(
        _ cars: [Vehicle],
        moving sources: [PersistentIdentifier],
        before: PersistentIdentifier?,
        in context: ModelContext
    ) throws { /* private */ }

    /// On launch the first car in the Garage is active again: tapping another car is for a
    /// look around, and the top car is the driver's main one (drag a car up to change it).
    static func activateMainCar(in context: ModelContext) { /* private */ }

    /// Makes `car` the only active vehicle. Map filter, Log and Spending follow it.
    static func activate(_ car: Vehicle, in context: ModelContext) throws { /* private */ }

    /// Deletes `car` and its fill-ups (cascade). If it was active, the main car (top of the
    /// Garage) takes over, as on launch.
    static func delete(_ car: Vehicle, in context: ModelContext) throws { /* private */ }
}
