// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// Body style: picks the illustration on the Garage card.
enum BodyType: String, Codable, CaseIterable, Identifiable, Sendable {
    case hatchback, sedan, estate, suv, van, convertible, coupe, pickup

    var id: Self { /* private */ }

    var label: String { /* private */ }

    /// SF Symbols only has side views for these shapes; the rest share the car shape.
    var symbol: String { /* private */ }
}

/// The paint colours cars are actually sold in, so the illustration can match.
/// Each has a name for VoiceOver; the colour alone never carries meaning.
enum CarColor: String, Codable, CaseIterable, Identifiable, Sendable {
    case black, white, silver, grey, blue, red, green, brown, beige, yellow, orange

    var id: Self { /* private */ }

    var label: String { /* private */ }

    /// sRGB, 0…1. Typical car paints, not UI colours.
    var rgb: (red: Double, green: Double, blue: Double) { /* private */ }

    var color: Color { /* private */ }

    /// Light paints need an outline to be visible on a light card.
    var needsOutline: Bool { /* private */ }

    /// The closest paint colour to a measured average colour (e.g. from a car photo).
    /// Grey-ish pixels map to black / grey / silver / white by lightness, so a
    /// slightly blue-tinted silver car isn't called blue.
    static func nearest(red: Double, green: Double, blue: Double) -> CarColor { /* private */ }

    private static func distance(
        _ a: (red: Double, green: Double, blue: Double),
        _ b: (Double, Double, Double)
    ) -> Double { /* private */ }
}
