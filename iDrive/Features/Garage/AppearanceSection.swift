// Source code is private. This file shows only its types and signatures.

import PhotosUI
import SwiftUI

/// The car's photo (background cut out, colour read from it) or, without one, a body style
/// and colour for the illustration. Apple Intelligence offers the make and model it sees.
struct AppearanceSection: View {
    @Bindable var draft: VehicleDraft

    @State private var photoItem: PhotosPickerItem?
    @State private var isProcessing
    /// Nil until a photo is processed in this session.
    @State private var wasCutOut: Bool?
    /// What Apple Intelligence saw in the photo, offered as a suggestion.
    @State private var identity: CarAssistant.CarIdentity?
    @State private var isIdentifying

    var body: some View { /* private */ }

    private var photoRow: some View { /* private */ }

    private func identityRow(_ identity: CarAssistant.CarIdentity) -> some View { /* private */ }

    /// "Red hatchback · Apple Intelligence"
    private func summary(_ identity: CarAssistant.CarIdentity) -> String { /* private */ }

    private func load(_ item: PhotosPickerItem?) { /* private */ }

    /// Asks the on-device model which car is in the photo, if it can see images.
    private func identify(_ image: UIImage) { /* private */ }
}
