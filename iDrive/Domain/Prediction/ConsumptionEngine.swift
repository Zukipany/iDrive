// Source code is private. This file shows only its types and signatures.

import Foundation

/// Learns how the driver's own car uses fuel or electricity at each temperature, from the
/// log: every measured stretch (full tank to full tank, or between known levels) is matched
/// with the weather while it was driven, and a line is fitted through them:
///
///     use at T = base + perDegree × (comfort − T)   below the comfort temperature
///     use at T = base                               above it
///
/// Cold costs every car more (a cold engine, thicker oil, denser air; an electric car heats
/// itself and its battery). How much depends on the car and the driver, so the slope is
/// learned. With few stretches, or only mild weather in the log, the data can't tell the
/// slope yet: it is pulled towards what typical cars do (the prior), and the more spread the
/// log covers, the more it follows the driver's own numbers (`learnedShare`).
nonisolated enum ConsumptionEngine {
    /// Above this the cold costs nothing: 15 °C for combustion, 20 °C for electric.
    static func comfortTemperature(electric: Bool) -> Double { /* private */ }
    /// What typical cars use more per °C below comfort, as a share of their base: electric
    /// +1.25 % (+25 % at 0 °C), combustion +0.5 % (+7.5 % at 0 °C; ADAC winter tests).
    static func typicalPerDegreeShare(electric: Bool) -> Double { /* private */ }
    /// The prior counts like this many stretches spread over ±5 °C.
    static let priorWeight
    static let priorSpread
    /// Stretches needed before the engine says anything about the driver's car.
    static let minimumIntervals

    /// One measured stretch and the weather while it was driven.
    struct Interval: Codable, Equatable, Sendable {
        let start: Date
        let end: Date
        let km: Double
        /// l or kWh per 100 km.
        let per100km: Double
        /// Mean °C of the days in the stretch; nil when the weather isn't known.
        var temperature: Double?
        /// Share of those days with rain or snow (1 mm or more).
        var wetShare: Double?
    }

    /// What the engine learned.
    struct Model: Codable, Equatable, Sendable {
        /// Use at or above the comfort temperature.
        let base: Double
        /// Extra use per °C below comfort.
        let perDegree: Double
        let comfort: Double
        let intervals: Int
        let km: Double
        /// Coldest and warmest stretch: what the log has seen.
        let coldest: Double
        let warmest: Double
        /// Typical miss of a single stretch (weighted root mean square), same unit as `base`.
        let typicalError: Double
        /// 0…1: how much of the slope comes from the driver's log rather than from typical cars.
        let learnedShare: Double

        func predict(temperature: Double) -> Double { /* private */ }

        /// How much more than at comfort it uses at `temperature`: 0.12 is +12 %.
        func extra(at temperature: Double) -> Double { /* private */ }
    }

    /// Fits the model to the stretches with a known temperature, each weighted by its km.
    /// Nil with fewer than `minimumIntervals` such stretches.
    static func fit(_ intervals: [Interval], electric: Bool) -> Model? { /* private */ }

    // MARK: Seasons

    enum Season: String, CaseIterable, Codable, Sendable {
        case winter, spring, summer, autumn

        /// Meteorological seasons: winter is December to February.
        static func of(_ date: Date, calendar: Calendar = .current) -> Season { /* private */ }

        var label: String { /* private */ }
    }

    struct SeasonFigure: Equatable, Sendable {
        let season: Season
        /// km-weighted l or kWh per 100 km.
        let per100km: Double
        let km: Double
        let intervals: Int
        let temperature: Double?
    }

    /// The driver's real use per season, each stretch counted in the season of its middle.
    static func seasons(_ intervals: [Interval], calendar: Calendar = .current) -> [SeasonFigure] { /* private */ }

    // MARK: Building the stretches

    /// Stretches from the consumption series (without weather yet).
    static func intervals(_ series: [FuelMath.ConsumptionPoint]) -> [Interval] { /* private */ }

    /// The stretches with the mean weather of their days.
    /// - Parameter days: mean °C and precipitation (mm) per calendar day of `calendar`.
    static func withWeather(
        _ intervals: [Interval],
        days: [Date: (temperature: Double, precipitation: Double)],
        calendar: Calendar = .current
    ) -> [Interval] { /* private */ }

    /// The calendar days a stretch covers: the day after it began through the day it ended
    /// (the tank was filled on the first day, then driven).
    static func dayRange(from start: Date, to end: Date, calendar: Calendar = .current) -> [Date] { /* private */ }
}

// MARK: Trips and plug-in hybrids

nonisolated extension ConsumptionEngine {
    /// The trip's use from the driver's own model: each forecast point's temperature, plus wet
    /// roads (`TripWeather`), each point counted for its km. Nil without a forecast.
    static func tripPer100km(_ model: Model, samples: [TripWeather.Sample]) -> Double? { /* private */ }

    /// A plug-in hybrid's stretches: each month's petrol use while on petrol (`HybridMix`),
    /// weighted by its petrol km. Its litres over all km would mix in the electric km.
    static func hybridIntervals(
        _ entries: [some FuelEntry],
        electricPer100km: Double,
        petrolPer100km: Double,
        now: Date = .now,
        calendar: Calendar = .current
    ) -> [(interval: Interval, electricShare: Double)] { /* private */ }
}
