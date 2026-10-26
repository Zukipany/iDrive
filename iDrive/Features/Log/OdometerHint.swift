// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Under the odometer field: the readings the entries around the chosen date allow, and a
/// warning when the reading looks like a typo (an extra digit). Saving stays possible.
struct OdometerHint: View {
    let bounds: FillUpRules.OdometerBounds
    let odometer: Int?
    /// km per full tank, to tell a long gap between fill-ups from a typo.
    let range: Double?

    private var suspiciousJump: Int? { /* private */ }

    var body: some View { /* private */ }
}
