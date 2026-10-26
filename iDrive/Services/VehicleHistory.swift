// Source code is private. This file shows only its types and signatures.

import Foundation
import SafariServices
import SwiftUI

/// Vehicle history (accidents, mileage readings, colour changes, damage, theft) isn't
/// public in Germany: it comes from paid services that collect registry, insurer,
/// workshop and marketplace records. carVertical's pre-check takes the VIN in the URL and
/// shows for free which records exist; the full report is bought there, not in iDrive.
/// (Their API is a business contract; this link needs none.)
enum VehicleHistory {
    static func precheckURL(vin: String) -> URL? { /* private */ }
}

/// A web page inside the app, with Safari's controls and a Done button.
struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController { /* private */ }
    func updateUIViewController(_ controller: SFSafariViewController, context: Context) { /* private */ }
}

/// A URL to show in `SafariView` via `.sheet(item:)`.
struct WebPage: Identifiable {
    let url: URL
    var id: String { /* private */ }
}
