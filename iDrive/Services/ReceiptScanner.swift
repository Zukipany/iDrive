// Source code is private. This file shows only its types and signatures.

import UIKit
import Vision

/// On-device OCR for receipts. Nothing leaves the phone.
enum ReceiptScanner {
    /// The receipt's printed rows, rebuilt from the OCR boxes (see `ReceiptLayout`).
    static func lines(in image: UIImage) async throws -> [String] { /* private */ }

    static func parse(_ image: UIImage) async throws -> ParsedReceipt { /* private */ }

    /// Every text fragment with its corners, from `RecognizeDocumentsRequest` (iOS 26).
    static func fragments(in image: UIImage) async throws -> (fragments: [ReceiptLayout.Fragment], aspectRatio: Double) { /* private */ }
}

private extension ReceiptLayout.Point {
    init(_ point: NormalizedPoint) { /* private */ }
}
