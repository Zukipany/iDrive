// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation
import Testing
@testable import iDrive

@Suite("Trip weather and Apple Maps hand-off")
struct TripWeatherTests {
    private func sample(_ km: Double, _ temperature: Double?, rain: Double = 0, snow: Double = 0) -> TripWeather.Sample { /* private */ }

    @Test("A forecast point every 50 km, with the hour the car is there; long routes at most 25")
    func samples() throws { /* private */ }

    @Test("Cold costs an electric car up to 40 %, a petrol car up to 8 %; rain and snow add")
    func factors() { /* private */ }

    @Test("Over the route each point counts for its km; where it rains or snows")
    func summary() throws { /* private */ }

    @Test("Open-Meteo: one list for all points, the hour nearest to each arrival")
    func decoding() throws { /* private */ }

    @Test("9a: Apple Maps gets every stop ahead as a waypoint, then the destination")
    func appleMapsRoute() throws { /* private */ }
}
