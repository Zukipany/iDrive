// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// A fuel price with its currency sign and two decimals, per litre or per gallon as the
/// Settings say: "2,07 €". (No tenth-of-a-cent digit: it rarely decides anything.)
struct PriceText: View {
    let price: Double?
    /// Shown as "≈2,41 €" and read as "about …".
    var isEstimate
    /// A kWh's price: never converted to gallons.
    var isElectric

    var body: some View { /* private */ }

    /// VoiceOver: "2,07 €" reads as euros and cents.
    static func spoken(_ price: Double) -> String { /* private */ }
}

nonisolated extension Double {
    /// Euros in the driver's currency: "90,95 €".
    var money: String { /* private */ }

    /// Kilometres as road distance in the driver's unit: "410 m", "1,3 km", "0.8 mi".
    var roadDistance: String { /* private */ }
}
