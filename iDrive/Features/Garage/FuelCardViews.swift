// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

/// The driver's fuel cards in the Garage. Map prices include their discounts.
struct FuelCardsSection: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \FuelCard.addedAt) private var cards: [FuelCard]
    @State private var showsPicker

    var body: some View { /* private */ }

    private func remove(_ card: FuelCard) { /* private */ }
}

/// Add a common program with one tap, recognise one from a photo of the card, or set up
/// any other card.
struct FuelCardPicker: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var cards: [FuelCard]

    /// Nil until a photo was read.
    @State private var recognised: [FuelCardPreset]?
    @State private var isReading

    var body: some View { /* private */ }

    /// Tapping adds the program, or removes it again; a checkmark shows it's added.
    private func presetRow(_ preset: FuelCardPreset, found: Bool) -> some View { /* private */ }

    private func read(_ image: UIImage) { /* private */ }
}

/// A card iDrive doesn't know: a name, the brands, cents off per litre.
struct CustomFuelCardForm: View {
    let onSave: () -> Void

    @Environment(\.modelContext) private var context
    @State private var name
    @State private var brands: Set<String>
    @State private var cents: Double?
    @State private var includesPremium
    @State private var isPoints
    @State private var until: Date?

    private var isValid: Bool { /* private */ }

    var body: some View { /* private */ }

    private var endsBinding: Binding<Bool> { /* private */ }

    private func brandRow(_ brand: String) -> some View { /* private */ }

    private func save() { /* private */ }
}
