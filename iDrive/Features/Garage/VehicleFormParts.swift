// Source code is private. This file shows only its types and signatures.

import SwiftUI
import UIKit

/// Paint colour swatches. Each has a name for VoiceOver and a checkmark when selected,
/// so selection doesn't rely on colour.
struct ColorSwatchPicker: View {
    @Binding var selection: CarColor?

    var body: some View { /* private */ }
}

/// The car on its Garage card: the cut-out photo, or the body style's symbol in the car's colour.
struct CarIllustration: View {
    let photo: Data?
    let bodyType: BodyType?
    let color: CarColor?
    let isElectric: Bool

    var body: some View { /* private */ }
}

/// The system camera for one still photo. Nil when the user cancels.
struct CameraPicker: UIViewControllerRepresentable {
    let onFinish: (UIImage?) -> Void

    static var isAvailable: Bool { /* private */ }

    func makeUIViewController(context: Context) -> UIImagePickerController { /* private */ }

    func updateUIViewController(_ controller: UIImagePickerController, context: Context) { /* private */ }

    func makeCoordinator() -> Coordinator { /* private */ }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let onFinish: (UIImage?) -> Void
        init(onFinish: @escaping (UIImage?) -> Void) { /* private */ }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) { /* private */ }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { /* private */ }
    }
}
