// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftUI

/// The location button's three steps, as in Apple Maps: show me, then turn the map with my
/// heading, then back to north up. Away from the user, or zoomed out while following, a tap
/// first flies back in to a few streets, every time (MapUserLocationButton keeps the zoom).
nonisolated enum LocateCycle: Equatable {
    /// The map shows somewhere else.
    case off
    case following
    case heading

    enum Step: Equatable {
        case zoomIn, showHeading, northUp
    }

    /// Metres of map height around the user after zooming in: a few streets each way.
    static let streetDistance
    /// Following further out than this, a tap zooms in again before it shows the heading.
    static let zoomedOutDistance

    init(_ position: MapCameraPosition) { /* private */ }

    /// What a tap does now; `distance` is the camera's last distance in metres.
    func next(distance: Double?) -> Step { /* private */ }

    /// Apple Maps' arrow: outlined, filled, and filled with the heading line.
    var symbol: String { /* private */ }
}

/// The glass location button over the map.
struct LocateButton: View {
    @Binding var position: MapCameraPosition
    /// The camera when it last stopped moving.
    let camera: MapCamera?
    let userCoordinate: CLLocationCoordinate2D?
    /// Shown while the map flies, so the arrow doesn't flick to "off" on the way.
    @State private var flyingTo: LocateCycle?

    private var state: LocateCycle { /* private */ }

    var body: some View { /* private */ }

    /// Names what the next tap does.
    private var label: LocalizedStringKey { /* private */ }

    private func tap() { /* private */ }

    /// Flies to the user, north up; follows them once there.
    private func fly(distance: Double) { /* private */ }

    private func follow() { /* private */ }
}
