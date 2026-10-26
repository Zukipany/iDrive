// Source code is private. This file shows only its types and signatures.

import CryptoKit
import ImageIO
import SwiftData
import UIKit

/// Cuts the car out of photos saved before every photo was cut out, or when it failed then
/// (Vision's model wasn't on the device yet). At launch, once per photo: a photo with
/// transparency is already cut out; one Vision can't lift stays as it is and isn't tried again.
/// The widgets follow on their own: their thumbnail is made again when the photo changes.
enum CarPhotoCleanup {
    private static let triedKey

    static func run(in context: ModelContext) async { /* private */ }

    /// True for an image with an alpha channel: a cut-out (the plain photos are JPEG).
    static func hasTransparency(_ data: Data) -> Bool { /* private */ }

    private static func fingerprint(_ data: Data) -> String { /* private */ }
}
