// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Content-layer card. HIG (Materials): Liquid Glass is for controls and navigation
/// only, so cards use the grouped background colour, which adapts to dark mode and
/// Increase Contrast automatically.
struct CardStyle: ViewModifier {
    @ScaledMetric(relativeTo: .body) private var padding

    func body(content: Content) -> some View { /* private */ }
}

extension View {
    func cardStyle() -> some View { /* private */ }
}

enum Theme {
    static let cornerRadius
    /// 8 / 16 / 24 spacing grid.
    static let spacing
    /// HIG minimum hit target.
    static let minTapTarget
}
