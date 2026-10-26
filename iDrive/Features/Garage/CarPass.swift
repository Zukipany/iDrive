// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// One car as a Wallet-style pass in its own paint colour. In the Garage stack only the
/// top strip (`stripHeight`) of a car behind the front one shows, so the strip carries
/// what tells cars apart: the name and the energy.
struct CarPass: View {
    let vehicle: Vehicle
    /// Height of the top strip, which is all that shows of a card further back.
    let stripHeight: Double

    private var paint: CarPaint { /* private */ }

    /// "Diesel", "Electric", "Plug-in Hybrid": the label at the top right, like "Debit" on a bank card.
    private var energyLabel: String { /* private */ }

    private var makeAndModel: String { /* private */ }

    var body: some View { /* private */ }

    private var strip: some View { /* private */ }

    /// The cut-out photo, or the body style in the card's ink.
    @ViewBuilder private var picture: some View { /* private */ }

    /// Bottom left, like the name and number on a bank card.
    private var details: some View { /* private */ }
}

/// The card's colours, worked out from the car's paint.
struct CarPaint {
    let rgb: (red: Double, green: Double, blue: Double)
    let isLight: Bool

    init(_ color: CarColor?) { /* private */ }

    /// Text and symbols: black on light paints, white on the rest.
    var ink: Color { /* private */ }

    /// Light falls from the top left like on lacquer, with a soft sheen across the card.
    var surface: some View { /* private */ }

    /// A light card would melt into a light screen without an edge.
    var edge: Color { /* private */ }

    private func shade(_ factor: Double) -> Color { /* private */ }
}
