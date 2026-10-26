// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// The front car's figures, under the Garage's stack of cars. The pass above shows who the
/// car is; this shows how it's doing. Content layer → no Liquid Glass.
struct VehicleFacts: View {
    let vehicle: Vehicle

    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    /// The card's figures, in reading order.
    private var facts: [(title: LocalizedStringKey, value: String)] { /* private */ }

    var body: some View { /* private */ }

    @ViewBuilder private var factsGrid: some View { /* private */ }

    private var capacityText: String { /* private */ }

    private func fact(_ title: LocalizedStringKey, _ value: String) -> some View { /* private */ }
}
