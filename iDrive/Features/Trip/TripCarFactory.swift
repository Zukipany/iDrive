// Source code is private. This file shows only its types and signatures.

import Foundation

/// The car's figures for a trip, from the Garage and the log.
enum TripCarFactory {
    /// The everyday figure from the log. A plug-in hybrid's litres over all km would count
    /// its electric km as petrol km, so its petrol use while on petrol is used (7c).
    @MainActor
    static func measuredAverage(_ vehicle: Vehicle, kind: Trip.Car.Kind, layer: EnergyLayer) -> FuelMath.Averages? { /* private */ }

    /// - Parameters:
    ///   - weather: the forecast along the route; without it the season decides (5b).
    ///   - learned: the car's own model and the forecast points, to predict from its history.
    @MainActor
    static func car(
        for vehicle: Vehicle,
        options: TripOptions,
        route: RouteProfile,
        month: Int,
        weather: TripWeather.Summary?,
        learned: (model: ConsumptionEngine.Model, samples: [TripWeather.Sample])? = nil
    ) -> (Trip.Car, TripConsumption.Figure) { /* private */ }

    /// The trip's consumption: the measured or rated figure × speed × weather, or, when the
    /// engine has learned the car, its own use at each forecast temperature × speed (5c).
    @MainActor
    private static func tripFigure(
        _ vehicle: Vehicle,
        kind: Trip.Car.Kind,
        route: RouteProfile,
        weatherFactor: Double,
        learned: (model: ConsumptionEngine.Model, samples: [TripWeather.Sample])?
    ) -> TripConsumption.Figure { /* private */ }

    /// The tank (or battery) now, from the last known level and the km driven since (1b).
    @MainActor
    private static func lastLevel(_ vehicle: Vehicle, layer: EnergyLayer, kmPerDay: Double, per100km: Double, capacity: Double) -> Double? { /* private */ }

    /// A plug-in hybrid's km on the battery when leaving (7a).
    @MainActor
    private static func hybridElectricKm(_ vehicle: Vehicle, options: TripOptions, kmPerDay: Double, factor: Double) -> Double { /* private */ }
}
