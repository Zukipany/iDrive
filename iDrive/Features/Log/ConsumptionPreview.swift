// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Tank levels as people read them: gauge fractions for fuel, percent for a battery.
nonisolated enum TankLevel {
    static func label(_ level: Double, isBattery: Bool) -> String { /* private */ }
}

/// The "This fill-up" section: distance since the last one, how full the tank was, and
/// the consumption, cost and range this fill-up shows. Read-only; the form owns the data.
struct ConsumptionPreview: View {
    struct Insight: Equatable {
        var kmSinceLast: Int?
        /// Full tanks: how full it was before filling, 0…1.
        var levelBefore: Double?
        var capacity: Double?
        var exceedsTank: Bool
        var reading: FuelMath.ConsumptionPoint?
        var range: Double?
        /// A partial fill without a level: consumption comes with the next known level.
        var waitsForLevel: Bool
        /// The reading is under half (true) or over twice (false) the usual: probably a
        /// fill-up missing in between or logged twice. Nil when it looks normal.
        var isUnusuallyLow: Bool?
    }

    let insight: Insight?
    /// kWh instead of litres.
    let isElectric: Bool
    /// The manufacturer's figure to compare with; nil when there's none for this energy.
    let rated: Double?

    var body: some View { /* private */ }

    /// "8 % above rated", or nil without a rated value. In the driver's unit: with miles per
    /// gallon, above means better.
    private var comparison: ((Double) -> String)? { /* private */ }

    private func footer(_ insight: Insight) -> String { /* private */ }
}
