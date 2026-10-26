// Source code is private. This file shows only its types and signatures.

import SwiftUI

enum AppTab: String, Hashable {
    case map, spending, garage, ask
}

/// Three tabs plus Ask (Apple Intelligence); the fill-up log is part of Spending. The system tab bar gets Liquid Glass
/// automatically on iOS 26.
/// Symbols use the outline names; the tab bar picks the filled variant itself.
struct RootTabView: View {
    /// Launch with `-startTab spending` (etc.) to open a specific tab.
    @State private var selection: AppTab
    @State private var tankFill
    private let router

    var body: some View { /* private */ }
}
