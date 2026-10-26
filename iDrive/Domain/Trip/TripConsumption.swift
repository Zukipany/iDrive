// Source code is private. This file shows only its types and signatures.

import Foundation

/// What the car uses on a trip, which differs from its everyday average.
nonisolated enum TripConsumption {
    /// Extra use at motorway speed, combustion share (+20 %)…
    static let motorwayExtraFuel
    /// …and electric (+35 %).
    static let motorwayExtraElectric
    /// Electric cars in winter (December–February) use this much more (+25 %)…
    static let winterExtraElectric
    /// …in November and March (+12 %)…
    static let coolExtraElectric
    /// …and combustion cars in winter (+5 %).
    static let winterExtraFuel

    /// Extra use from speed (measure 5a). Drag grows with the square of speed: a petrol car
    /// at 130 km/h uses about 20 % more than its mixed figure, an electric car about 35 %
    /// (ADAC Autobahn tests). The route's average speed includes towns and traffic, so 110 km/h
    /// on average already means long fast stretches.
    static func speedFactor(averageKmh: Double, electric: Bool) -> Double { /* private */ }

    /// Extra use from cold (measure 5b): heating and a cold battery cost an electric car
    /// 20–30 % in winter, a combustion car about 5 %. Nil `cold` means decide by the month.
    static func coldFactor(month: Int, cold: Bool?, electric: Bool) -> Double { /* private */ }

    /// The everyday figure to start from (measure 5c): the driver's own measured average
    /// once it covers 500 km, otherwise the rated figure plus 10 % (WLTP is optimistic).
    static func baseline(measured: FuelMath.Averages?, rated: Double) -> Double { /* private */ }

    /// The trip figure: baseline × speed × weather, with the parts for the summary line.
    struct Figure: Codable, Equatable, Sendable {
        let per100km: Double
        let baseline: Double
        let speedFactor: Double
        let weatherFactor: Double
        let isMeasured: Bool
        /// Measured stretches the consumption engine learned the weather effect from; nil
        /// when typical cars' figures were used.
        var learnedFrom: Int?
    }

    /// - Parameter weatherFactor: from the forecast along the route (`TripWeather`), or by
    ///   season when it can't be loaded (`coldFactor`).
    static func figure(
        measured: FuelMath.Averages?,
        rated: Double,
        averageKmh: Double,
        weatherFactor: Double,
        electric: Bool
    ) -> Figure { /* private */ }

    // MARK: Level when leaving (measure 1b)

    /// Where the gauge is probably now: the last known level, minus the km driven since at
    /// the car's usual km per day. Nil without a known level in the log.
    static func estimatedLevel(
        lastLevel: Double?,
        lastDate: Date?,
        kmPerDay: Double,
        per100km: Double,
        capacity: Double,
        now: Date = .now
    ) -> Double? { /* private */ }

    /// km per day over the log: last odometer minus the first, over the days between.
    static func kmPerDay(_ entries: [some FuelEntry]) -> Double { /* private */ }

    // MARK: Electric cars (measure 6)

    enum Plug: String, Codable, CaseIterable, Sendable {
        case ccs, chademo, type2, nacs

        var label: String { /* private */ }

        /// What sources call it: "CCS", "CCS1", "Combo 2", "IEC 62196 Type 2"…
        static func matching(_ kind: String?) -> Plug? { /* private */ }
    }

    /// Minutes to charge `kWh` at a charger: the power the car and charger agree on, at 75 %
    /// on average from 10 to 80 % (the curve tapers), plus 3 minutes to plug in and pay.
    static func chargingMinutes(kWh: Double, chargerKW: Double?, carMaxKW: Double) -> Double { /* private */ }

    // MARK: Plug-in hybrids (measure 7)

    /// km on electricity when leaving: battery level × size ÷ electric use, with the speed
    /// and weather factors too.
    static func electricKm(batteryLevel: Double, batteryKWh: Double, electricPer100km: Double, factor: Double) -> Double { /* private */ }
}
