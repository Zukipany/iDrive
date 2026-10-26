// Source code is private. This file shows only its types and signatures.

import SwiftUI
import UIKit

extension View {
    /// Number and decimal pads have no return key, so without this the keyboard can't be
    /// closed (and covers the rest of the form). Adds "Done" above the keyboard and lets
    /// scrolling dismiss it.
    func keyboardDoneButton() -> some View { /* private */ }
}
