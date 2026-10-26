// Source code is private. This file shows only its types and signatures.

import CoreLocation
import SwiftUI

/// A station in the nearby list, drawn like its pin on the map: the same price badge (green
/// rim and star for the cheapest, red for the dear ones), a round badge in the same colour,
/// then where it is. Closed stations are dimmed and say so.
struct StationListRow: View {
    let station: Station
    /// One price badge per selected fuel: compare mode when several are on.
    let fuels: [FuelType]
    let tier: StationRanking.Tier?
    let origin: CLLocationCoordinate2D?

    var body: some View { /* private */ }

    @ViewBuilder private var prices: some View { /* private */ }

    /// "1,2 km NE"
    private var distanceText: String { /* private */ }
}

/// A charger in the nearby list, like its pin on the map: bolt badge, power, connectors and
/// free points, and the same price badge.
struct ChargerListRow: View {
    let charger: ChargePoint
    let tier: StationRanking.Tier?
    let origin: CLLocationCoordinate2D?

    var body: some View { /* private */ }
}

extension ChargerListRow {
    /// "150 kW · 2 of 4 free", free points in green.
    fileprivate var equipment: some View { /* private */ }
}

/// The round badge before a row: the brand's initial (or a symbol), ringed in the price tier's
/// colour as on the map. The tier is also in the price badge's star and words.
struct BrandBadge: View {
    let name: String
    let symbol: String?
    let tier: StationRanking.Tier?
    var symbolColor: Color

    var body: some View { /* private */ }

    private var ringColor: Color { /* private */ }

    private var initials: String { /* private */ }
}

/// A small fact under a row's name: "1,2 km NE", "Closed", "−2 ct ADAC".
struct MetaChip: View {
    let text: String
    let symbol: String
    var tint: Color

    var body: some View { /* private */ }
}

extension Station {
    /// The address for the list: data in capitals ("UNGERERSTR. 54, MUENCHEN") in title case.
    var listAddress: String { /* private */ }
}
