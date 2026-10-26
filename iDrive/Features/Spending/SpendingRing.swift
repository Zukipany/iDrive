// Source code is private. This file shows only its types and signatures.

import Charts
import SwiftUI

/// The month as a ring: by energy type, or budget spent vs left. `progress` draws it in.
struct SpendingRing: View {
    let summary: SpendingSummary
    let budget: Double
    var progress
    let lineWidth: Double

    var body: some View { /* private */ }
}

/// "Saved 4,20 € vs the average nearby", or what it cost more. Not colour alone: the
/// words and the arrow say which way it went.
struct SavingsLabel: View {
    let savings: Savings

    var body: some View { /* private */ }
}
