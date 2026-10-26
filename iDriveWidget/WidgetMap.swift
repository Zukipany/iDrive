// Source code is private. This file shows only its types and signatures.

import MapKit
import UIKit

/// The large widget's map. WidgetKit can't show a live map, so MapKit draws a picture of
/// the area (once light, once dark) and the stations' spots on it are worked out here; the
/// widget puts its own price pins on top, so they stay sharp and readable.
enum WidgetMap {
    struct Picture {
        let light: UIImage
        let dark: UIImage
        /// The size it was drawn at, in points; the spots are in this space.
        let size: CGSize
        /// Each station's spot, by station id.
        let spots: [String: CGPoint]
        /// Where the search was: the blue dot.
        let origin: CGPoint
    }

    /// A price pin, standing on its spot or hanging from it: the map leaves room for one at
    /// every edge.
    static let pinSize
    /// The share of the large widget's height the map takes; the car's panel has the rest.
    static let heightShare
    /// The map is framed on the cheapest few, so their pins have room; the rest show where they fall.
    static let framedStations
    /// Never closer in than this across, so a single station nearby isn't a street-level view.
    static let minimumWidthMeters

    static func size(in widget: CGSize) -> CGSize { /* private */ }

    /// Nil when MapKit can't draw (offline): the widget then shows its list without a map.
    static func draw(_ prices: WidgetSnapshot.Prices, size: CGSize) async -> Picture? { /* private */ }

    /// The cheapest `framedStations` and the search point, centred, with room for a pin above
    /// or below each spot and beside it.
    static func mapRect(for prices: WidgetSnapshot.Prices, size: CGSize) -> MKMapRect { /* private */ }

    /// Muted and without MapKit's own places, so the price pins stand out.
    private static func snapshot(_ rect: MKMapRect, size: CGSize, style: UIUserInterfaceStyle) async -> MKMapSnapshotter.Snapshot? { /* private */ }
}

extension WidgetSnapshot.Prices {
    var origin: CLLocationCoordinate2D { /* private */ }
}

extension WidgetSnapshot.Prices.Station {
    var coordinate: CLLocationCoordinate2D { /* private */ }
}
