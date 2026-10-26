// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

/// A fuel card, club membership or app the driver uses. Map prices show the best discount
/// of all added cards. Only the program is stored, never a card number.
@Model
final class FuelCard {
    /// A `FuelCardPreset` id, or nil for a card the driver set up.
    var presetID: String?
    var name: String
    /// The driver's own terms; presets use the app's current terms instead.
    var customRules: [DiscountRule]
    var addedAt: Date

    init(preset: FuelCardPreset, addedAt: Date = .now) { /* private */ }

    init(name: String, rules: [DiscountRule], addedAt: Date = .now) { /* private */ }

    var preset: FuelCardPreset? { /* private */ }

    var card: DiscountCard { /* private */ }

    /// "Esso 2 ct/l until 15 Oct …" for a preset; "Shell, Aral · 3 ct/l" for a custom card.
    var summary: String { /* private */ }
}
