// Source code is private. This file shows only its types and signatures.

import Foundation

/// Sorting and price statistics for the station list and map pins.
nonisolated enum StationRanking {
    struct PriceStats: Equatable, Sendable {
        let min: Double
        let average: Double
        let max: Double
        let count: Int
    }

    enum Tier: Equatable, Sendable {
        /// The single cheapest open station.
        case cheapest
        case cheap, average, expensive
    }

    /// Open stations with a price first (cheapest first), then closed ones,
    /// then stations that don't sell this fuel. Ties go to the nearer station.
    static func sorted(_ stations: [Station], by fuel: FuelType) -> [Station] { /* private */ }

    private static func rank(_ station: Station, _ fuel: FuelType) -> Int { /* private */ }

    /// Min / average / max over open stations that sell the fuel.
    static func stats(_ stations: [Station], fuel: FuelType) -> PriceStats? { /* private */ }

    static func cheapest(_ stations: [Station], fuel: FuelType) -> Station? { /* private */ }

    /// What filling `liters` at the cheapest station saves compared with the average.
    /// Example: average 1.789, cheapest 1.729, 60 l → 3.60 €.
    static func savings(_ stats: PriceStats, liters: Double) -> Double { /* private */ }

    /// Bottom 20 % of the price range is cheap, top 20 % expensive.
    static func tier(price: Double, stats: PriceStats, isCheapest: Bool) -> Tier { /* private */ }
}
