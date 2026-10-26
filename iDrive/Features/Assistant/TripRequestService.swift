// Source code is private. This file shows only its types and signatures.

import CoreLocation
import FoundationModels
import MapKit

/// Turns a trip said to the assistant into a saved trip under the planner: finds the places
/// on Apple Maps (from the driver's location when no start was said) and says what it saved.
@MainActor
enum TripRequestService {
    static func save(_ request: TripRequest, near location: CLLocationCoordinate2D?) async -> String { /* private */ }

    /// The best Apple Maps match, preferring places near the driver.
    static func place(_ name: String, near location: CLLocationCoordinate2D?) async -> MKMapItem? { /* private */ }
}

/// Lets Apple Intelligence save a trip when the parser couldn't read the request.
struct SaveTripTool: Tool {
    let name
    let description
    let near: CLLocationCoordinate2D?

    @Generable
    struct Arguments {
        @Guide(description: "The destination city or address, as the user said it")
        var destination: String
        @Guide(description: "Where the trip starts; empty when the user didn't say, then it is their current location")
        var start: String
        @Guide(description: "Days from today: 0 today, 1 tomorrow, 2 the day after tomorrow", .range(0...30))
        var dayOffset: Int
        @Guide(description: "Hour of departure, 0 to 23. Morning 8, noon 12, afternoon 15, evening 19", .range(0...23))
        var hour: Int
        @Guide(description: "Minute of departure, 0 to 59", .range(0...59))
        var minute: Int
    }

    func call(arguments: Arguments) async throws -> String { /* private */ }
}
