// Source code is private. This file shows only its types and signatures.

import CoreLocation
import CryptoKit
import ImageIO
import UIKit
import WidgetKit

/// Writes what the Home Screen widgets show (`WidgetSnapshot`) and asks them to redraw.
enum WidgetSharing {
    /// The widget's photo is at most this wide, in pixels: sharp at the 110 pt it's drawn.
    static let photoPixels

    /// The active car, when the app goes to the background: every fill-up, odometer reading
    /// or switch to another car changes what the widgets show. Nothing is written (and the
    /// widgets don't reload) when nothing changed.
    static func share(car vehicle: Vehicle?) { /* private */ }

    /// The fuel whose prices the widgets show for a car: premium diesel has no reported
    /// prices (the map estimates them), so its drivers see diesel's.
    static func priceFuel(for fuel: FuelType) -> FuelType { /* private */ }

    /// A short hash of the full-size photo: the thumbnail is made again only when it changes.
    private static func fingerprint(_ data: Data) -> String { /* private */ }

    /// The photo at most `photoPixels` wide: PNG when it has transparency (a cut-out car), else JPEG.
    private static func thumbnail(_ data: Data) -> Data? { /* private */ }
}

extension WidgetSnapshot.Car {
    init(_ vehicle: Vehicle, photo: Data?, photoID: String?) { /* private */ }
}

extension WidgetSnapshot.Prices {
    /// The open stations with a price for `fuel`, cheapest first (the nearer on a tie), as the
    /// map ranks them. Nil when none has one.
    init?(stations: [iDrive.Station], fuel: FuelType, near point: CLLocationCoordinate2D, at date: Date) { /* private */ }

    /// Chargers of the car's kind (AC or DC): priced ones cheapest first, then the nearest
    /// without a price, as the map's list ranks them. Nil when there are none.
    init?(chargers: [ChargePoint], kind: FuelType, near point: CLLocationCoordinate2D, at date: Date) { /* private */ }
}
