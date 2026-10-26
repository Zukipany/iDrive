// Source code is private. This file shows only its types and signatures.

import CoreGraphics
import Foundation
import FoundationModels

/// Car suggestions from Apple Intelligence, on the device: no account, no cost, works offline.
///
/// The on-device model is small (about 3 billion parameters) and can be wrong about
/// specifications, so it's used only where the bundled catalog has no answer, and the
/// form always shows results as suggestions to check, never as facts.
/// Apple's larger Private Cloud Compute model (iOS 27) needs a managed entitlement from
/// Apple; once granted, it's a one-line change in `session(instructions:)`.
enum CarAssistant {
    /// Nil when Apple Intelligence can be used; otherwise why not, for the UI.
    static var unavailableReason: String? { /* private */ }

    static var isAvailable: Bool { /* private */ }

    /// True when the on-device model can look at photos (iOS 27 image attachments).
    static var canSeeImages: Bool { /* private */ }

    @Generable
    enum Paint: String {
        case black, white, silver, grey, blue, red, green, brown, beige, yellow, orange
    }

    @Generable
    struct CarIdentity {
        @Guide(description: "The car's make as sold in Germany, e.g. Volkswagen, BMW, Škoda; empty if unsure")
        var make: String
        @Guide(description: "The model name without generation, e.g. Golf, 3 Series; empty if unsure")
        var model: String
        var bodyStyle: BodyStyle
        @Guide(description: "The main paint colour of the car body")
        var colour: Paint
    }

    /// Make, model, body style and colour of the car in a photo. On the device; the photo
    /// doesn't leave the phone.
    static func identifyCar(in image: CGImage) async throws -> CarIdentity { /* private */ }

    @Generable
    struct ReceiptReading {
        @Guide(description: "Litres (or kWh) of the fuel line, not shop items")
        var amount: Double?
        @Guide(description: "Price per litre (or per kWh) in euros, usually with three decimals")
        var pricePerUnit: Double?
        @Guide(description: "Total paid in euros for the fuel, after discounts")
        var total: Double?
    }

    /// A second reading of a fuel receipt, for values the text reader wasn't sure about.
    static func readReceipt(_ image: CGImage) async throws -> ReceiptReading { /* private */ }

    @Generable
    enum BodyStyle: String {
        case hatchback, sedan, estate, suv, van, convertible, coupe, pickup
    }

    @Generable
    enum Energy: String {
        case petrol, diesel, electric, plugInHybrid
    }

    @Generable
    struct Specs {
        @Guide(description: "The body style this model is mostly sold as in Germany")
        var bodyStyle: BodyStyle
        @Guide(description: "The most common energy type for this model and year")
        var energy: Energy
        @Guide(description: "Fuel tank volume in litres; 0 for battery-electric cars", .range(0...120))
        var tankLiters: Int
        @Guide(description: "Usable battery capacity in kWh; 0 if the car has no traction battery", .range(0...130))
        var batteryKWh: Int
        @Guide(
            description: "Typical WLTP combined consumption: litres per 100 km, or kWh per 100 km for electric cars",
            .range(2...35)
        )
        var consumption: Double
    }

    /// Typical specs for a car that isn't in the bundled catalog.
    static func suggestSpecs(make: String, model: String, year: Int?) async throws -> Specs { /* private */ }

    private static func session(instructions: String) -> LanguageModelSession { /* private */ }
}
