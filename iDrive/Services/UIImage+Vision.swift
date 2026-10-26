// Source code is private. This file shows only its types and signatures.

import ImageIO
import UIKit

extension UIImage {
    /// The orientation Vision needs to read the image upright.
    var cgOrientation: CGImagePropertyOrientation { /* private */ }

    /// A copy whose longer side is at most `maxSide` points, drawn upright.
    func downscaled(maxSide: CGFloat) -> UIImage { /* private */ }
}
