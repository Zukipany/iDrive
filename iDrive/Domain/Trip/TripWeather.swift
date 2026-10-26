// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// The weather along a route at the hour the car passes each point (measure 5b), from a
/// forecast for the start, the destination and every point between.
nonisolated enum TripWeather {
    /// A point every this many km gets its own forecast, at most `maxPoints` points.
    static let spacingKm
    static let maxPoints

    /// One forecast point: where, when the car is there, and the weather then.
    struct Sample: Codable, Equatable, Sendable {
        let km: Double
        let latitude: Double
        let longitude: Double
        let eta: Date
        /// °C at 2 m.
        var temperature: Double?
        /// mm in that hour.
        var precipitation: Double?
        /// cm in that hour.
        var snowfall: Double?
    }

    /// What the summary line says: the coldest and warmest point, and where it rains or snows.
    struct Summary: Codable, Equatable, Sendable {
        let lowest: Double
        let highest: Double
        /// km of the first point with rain, nil when dry.
        let rainFromKm: Double?
        /// km of the first point with snow.
        let snowFromKm: Double?
        /// The factors the plan used, distance-weighted over the route.
        let fuelFactor: Double
        let electricFactor: Double
    }

    /// The points to ask for: the start, every `spacingKm`, the destination, each with the
    /// time the car is there (departure + driving time to it).
    static func samples(route: RouteProfile, departure: Date) -> [Sample] { /* private */ }

    // MARK: Effect on consumption

    /// Below this an electric car needs heating and a warm battery: up to `electricColdExtra`
    /// more at 0 °C, at most `electricColdCap` (ADAC winter tests: 20–40 %).
    static let electricComfortTemperature
    static let electricColdExtra
    static let electricColdCap
    /// Above this the air conditioning costs an electric car a little (+5 %).
    static let electricHotTemperature
    static let electricHotExtra
    /// A cold engine and denser air cost a combustion car a little: +5 % at −5 °C (15 °C
    /// below 10 °C), at most +8 %.
    static let fuelComfortTemperature
    static let fuelColdExtra
    static let fuelColdCap
    /// Wet roads (0.5 mm an hour or more) add rolling resistance: +5 %; snow +10 %.
    static let rainThreshold
    static let rainExtra
    static let snowExtra

    /// The factor at one point.
    static func factor(_ sample: Sample, electric: Bool) -> Double { /* private */ }

    /// The factor over the whole route: each point counts for the km until the next one.
    /// Nil when no point has a forecast (offline): the plan falls back to the season.
    static func summary(_ samples: [Sample]) -> Summary? { /* private */ }
}

/// Open-Meteo's forecast (no key, CC BY 4.0, free for non-commercial use under 10,000
/// requests a day): one request for every point of the route, hourly, times in Unix seconds.
nonisolated enum OpenMeteoAPI {
    static let attributionURL

    static func request(_ samples: [TripWeather.Sample], now: Date = .now) -> URLRequest { /* private */ }

    private struct Hourly: Decodable {
        let time: [Double]
        let temperature2m: [Double?]
        let precipitation: [Double?]
        let snowfall: [Double?]

        private enum CodingKeys: String, CodingKey {
            case time, precipitation, snowfall
            case temperature2m
        }
    }

    private struct Location: Decodable {
        let hourly: Hourly
    }

    /// The samples with the hour nearest to each one's arrival. One location answers as an
    /// object, several as a list in the order asked.
    static func decode(_ data: Data, into samples: [TripWeather.Sample]) throws -> [TripWeather.Sample] { /* private */ }
}

nonisolated extension Array {
    subscript(safe index: Int) -> Element? { /* private */ }
}
