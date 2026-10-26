// Source code is private. This file shows only its types and signatures.

import Foundation

extension DemoCars {
    /// The demo cars' specs, versions and reminder dates.
    static func makeCar(_ kind: Kind, now: Date) -> Vehicle { /* private */ }

    /// One reminder soon for each car, so the Garage shows the badges: the Golf's TÜV next
    /// month, the 320d's service in three weeks; the young X5's first TÜV is in 2027.
    private static func reminders(_ kind: Kind, now: Date) -> (inspection: Date?, service: Date?) { /* private */ }
}
