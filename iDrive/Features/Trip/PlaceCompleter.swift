// Source code is private. This file shows only its types and signatures.

import MapKit
import Observation

/// Destination suggestions while typing, from Apple Maps.
@MainActor @Observable
final class PlaceCompleter: NSObject, MKLocalSearchCompleterDelegate {
    private(set) var results: [MKLocalSearchCompletion]
    var query {
        didSet { /* private */ }
    }

    private let completer

    override init() { /* private */ }

    nonisolated func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) { /* private */ }

    nonisolated func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: any Error) { /* private */ }

    /// The place behind a suggestion.
    func mapItem(for completion: MKLocalSearchCompletion) async -> MKMapItem? { /* private */ }
}
