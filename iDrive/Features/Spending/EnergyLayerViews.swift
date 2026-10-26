// Source code is private. This file shows only its types and signatures.

import SwiftUI

extension EnergyLayer {
    var label: String { /* private */ }

    func color(for vehicle: Vehicle) -> Color { /* private */ }
}

/// Chooses which energy is drawn in front.
struct LayerPicker: View {
    @Binding var front: EnergyLayer

    var body: some View { /* private */ }
}

struct LayerLegend: View {
    let vehicle: Vehicle

    var body: some View { /* private */ }
}
