// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// A station's or charger's initials ("A", "JET") on a rounded square, or a symbol for
/// chargers. iDrive draws no brand logos or colours (they're trademarks). Three looks:
/// light and dark follow the appearance; on tinted and clear Home Screens, where a widget is
/// drawn in one tint, it's an outline, since a filled square would hide its own letters.
struct InitialsBadge: View {
    let name: String
    var size: CGFloat
    /// Instead of initials, e.g. "bolt.fill" for a charger.
    var symbol: String?
    var symbolColor: Color

    @Environment(\.widgetRenderingMode) private var renderingMode

    private var isTinted: Bool { /* private */ }

    var body: some View { /* private */ }

    /// "Aral" → "A", "JET" → "JET" (short capitals as they are), "" → "?".
    nonisolated static func initials(of name: String) -> String { /* private */ }
}
