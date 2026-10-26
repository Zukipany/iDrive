// Source code is private. This file shows only its types and signatures.

import SwiftUI
import VisionKit

/// VisionKit's document camera: edge detection and perspective correction for free.
/// Not available in the Simulator; `LogScreen` falls back to the photo picker there.
struct DocumentScanner: UIViewControllerRepresentable {
    let onScan: (UIImage) -> Void
    let onCancel: () -> Void

    static var isAvailable: Bool { /* private */ }

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController { /* private */ }

    func updateUIViewController(_ controller: VNDocumentCameraViewController, context: Context) { /* private */ }

    func makeCoordinator() -> Coordinator { /* private */ }

    final class Coordinator: NSObject, @MainActor VNDocumentCameraViewControllerDelegate {
        let onScan: (UIImage) -> Void
        let onCancel: () -> Void

        init(onScan: @escaping (UIImage) -> Void, onCancel: @escaping () -> Void) { /* private */ }

        func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFinishWith scan: VNDocumentCameraScan
        ) { /* private */ }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) { /* private */ }

        func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFailWithError error: any Error
        ) { /* private */ }
    }
}
