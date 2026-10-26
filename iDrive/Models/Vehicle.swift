// Source code is private. This file shows only its types and signatures.

import Foundation
import SwiftData

@Model
final class Vehicle {
    var name: String
    var make: String
    var modelName: String
    /// The exact version ("xDrive40d", "AMG G 63"), if known.
    var version: String?
    var year: Int
    /// Primary energy. For a battery-electric car this is `.evAC`.
    var fuelTypeRaw: String
    /// Plug-in hybrids: electric as a second energy type.
    var secondaryFuelRaw: String?
    /// See `extraFuels`. Defaults to none, so existing cars migrate unchanged.
    var extraFuelsRaw: [String]
    /// Litres. 0 for battery-electric cars.
    var tankCapacity: Double
    /// kWh. Set for battery-electric cars and plug-in hybrids.
    var batteryCapacity: Double?
    /// A plug-in hybrid's electric consumption, kWh/100 km (WLTP). Its fuel figure is
    /// `ratedConsumption`, with an empty battery.
    var electricConsumption: Double?
    /// l/100 km, or kWh/100 km for battery-electric cars.
    var ratedConsumption: Double
    var isActive: Bool
    var createdAt: Date
    /// 17-character vehicle identification number, optional.
    var vin: String?
    var bodyTypeRaw: String?
    var colorRaw: String?
    /// The car photo, background removed when Vision can find the car.
    @Attribute(.externalStorage) var photo: Data?
    /// Short description written by Apple Intelligence on the device. Shown as generated text.
    /// No longer written or shown; kept so stores that have it still open.
    var aboutText: String?
    /// Odometer when the car was added, so validation works before the first fill-up.
    var startOdometer: Int?
    /// Position in the Garage; people drag cars to reorder them.
    var sortIndex: Int
    /// Next main inspection (TÜV/HU) and service; reminders 30 and 7 days before.
    var inspectionDue: Date?
    var serviceDue: Date?

    @Relationship(deleteRule: .cascade, inverse: \FillUp.vehicle)
    var fillUps: [FillUp]

    init(
        name: String,
        make: String = "",
        modelName: String = "",
        year: Int,
        fuelType: FuelType,
        tankCapacity: Double,
        ratedConsumption: Double,
        isActive: Bool = false,
        secondaryFuel: FuelType? = nil,
        batteryCapacity: Double? = nil,
        extraFuels: [FuelType] = [],
        createdAt: Date = .now
    ) { /* private */ }
}

extension Vehicle {
    var fuelType: FuelType {
        get { /* private */ }
        set { /* private */ }
    }

    var secondaryFuel: FuelType? {
        get { /* private */ }
        set { /* private */ }
    }

    var isBatteryElectric: Bool { /* private */ }
    var isPlugInHybrid: Bool { /* private */ }

    /// Further fuels of the same kind as `fuelType`: E5 next to E10, or premium next to
    /// regular diesel. Fuels of another kind are dropped, so petrol and diesel never mix.
    var extraFuels: [FuelType] {
        get { /* private */ }
        set { /* private */ }
    }

    /// Every fuel this car tanks, the usual one first. Empty for battery-electric cars.
    var fuels: [FuelType] { /* private */ }

    /// Everything this car can tank or charge. Drives the default map filter and the
    /// fuel choice when logging.
    var energyTypes: [FuelType] { /* private */ }

    private static func sameKind(_ fuels: [FuelType], as main: FuelType) -> [FuelType] { /* private */ }

    var subtitle: String { /* private */ }

    var bodyType: BodyType? {
        get { /* private */ }
        set { /* private */ }
    }

    var carColor: CarColor? {
        get { /* private */ }
        set { /* private */ }
    }

    /// Litres for fuel, kWh for charging; nil when not set.
    func capacity(for fuel: FuelType) -> Double? { /* private */ }

    /// Consumption per fill-up for one energy (fuel or charging), using the tank or
    /// battery size for partial fills.
    /// Consumption readings for charts and averages, without the ones that are most likely a
    /// forgotten or doubled fill-up (`FuelMath.isOutlier`); `leftOutReadings` counts those.
    func consumptionSeries(_ layer: EnergyLayer) -> [FuelMath.ConsumptionPoint] { /* private */ }

    /// How many readings `consumptionSeries` leaves out.
    func leftOutReadings(_ layer: EnergyLayer) -> Int { /* private */ }

    func allReadings(_ layer: EnergyLayer) -> [FuelMath.ConsumptionPoint] { /* private */ }

    /// The energy this car mostly uses: electric for EVs, fuel otherwise.
    var mainLayer: EnergyLayer { /* private */ }

    /// The highest known odometer: the last fill-up, or the reading when the car was added.
    var lastOdometer: Int? { /* private */ }
}
