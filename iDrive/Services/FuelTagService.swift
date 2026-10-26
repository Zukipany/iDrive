// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// Reads OpenStreetMap's premium-diesel tags (`fuel:GTL_diesel`) around a point via the
/// Overpass API. Only fetched while the Premium chip is on; cached for a day because
/// mappers rarely change these tags. Licence ODbL: the map shows "© OpenStreetMap".
actor FuelTagService {
    private let fetch: HTTP.Fetcher
    private let now: @Sendable () -> Date
    private let cacheLifetime: TimeInterval
    private var cache

    init(fetch: @escaping HTTP.Fetcher = HTTP.data(for:), now: @escaping @Sendable () -> Date = { }) { /* private */ }

    func premiumDieselTags(near coordinate: CLLocationCoordinate2D, radiusKm: Double) async throws -> [PremiumDiesel.Tag] { /* private */ }

    /// Only stations that have the tag, so the answer stays small.
    static func query(_ coordinate: CLLocationCoordinate2D, radiusKm: Double) -> String { /* private */ }

    /// "yes" and "no" count; other values ("only", typos) are skipped.
    static func decode(_ data: Data) throws -> [PremiumDiesel.Tag] { /* private */ }
}
