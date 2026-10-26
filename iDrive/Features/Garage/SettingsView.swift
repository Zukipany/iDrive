// Source code is private. This file shows only its types and signatures.

import SwiftUI
import WidgetKit

/// Units and currency, from the Garage's gear button. Fill-ups stay stored in km, litres and
/// euros, so switching changes only what's shown and typed.
struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var settings

    var body: some View { /* private */ }

    /// "Euro (EUR)"
    private func name(of code: String) -> String { /* private */ }

    private var currencyFooter: String { /* private */ }
}
