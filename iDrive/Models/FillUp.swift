// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import SwiftData

@Model
final class FillUp {
    var date: Date
    /// Litres or kWh.
    var amount: Double
    /// €/l or €/kWh.
    var pricePerUnit: Double
    /// € paid.
    var total: Double
    /// km on the odometer when filling up.
    var odometer: Int
    var isFullTank: Bool
    /// Level after a partial fill, 0…1 (gauge eighths, or the battery %). Nil when full
    /// or unknown; see `tankLevelAfter`.
    var partialLevel: Double?
    var fuelTypeRaw: String
    var stationName: String?
    /// The average board price in the map's radius when this was logged (`NearbyPrices`).
    var nearbyAveragePrice: Double?
    /// Where it was logged, when the location was known: tells the consumption engine
    /// where the car is driven, for the weather (`DrivingArea`).
    var latitude: Double?
    var longitude: Double?
    @Attribute(.externalStorage) var receiptImage: Data?
    var vehicle: Vehicle?

    init(
        date: Date,
        amount: Double,
        pricePerUnit: Double,
        total: Double,
        odometer: Int,
        isFullTank: Bool,
        fuelType: FuelType,
        stationName: String? = nil,
        partialLevel: Double? = nil,
        nearbyAveragePrice: Double? = nil,
        vehicle: Vehicle?
    ) { /* private */ }
}

extension FillUp {
    /// Where the car is driven, for the consumption engine's weather: only for a fill-up
    /// logged now, not a receipt from last week.
    func place(at location: CLLocation?, loggedAt date: Date) { /* private */ }
}

extension FillUp: FuelEntry {
    var tankLevelAfter: Double? { /* private */ }

    var fuelType: FuelType {
        get { /* private */ }
        set { /* private */ }
    }
}
