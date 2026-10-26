// Source code is private. This file shows only its types and signatures.

import CoreLocation
import SwiftData
import SwiftUI

/// Root of the map sheet: a page for fuel stations, one for chargers and one for favourites,
/// under a tab bar that matches the map's chips (swipe or tap). Rows look like their pins on
/// the map and push a detail page; `MapScreen` owns the NavigationStack so tapping a pin
/// opens the same page.
struct StationListSheet: View {
    let model: MapViewModel
    let tankLiters: Double?
    /// Battery of the active car, for the charging saving.
    let batteryKWh: Double?
    /// The user's position, for "410 m east" in the rows.
    let origin: CLLocationCoordinate2D?
    let refresh: () async -> Void

    @Query(sort: \FavoriteStation.addedAt) private var favorites: [FavoriteStation]
    /// Remembered between launches.
    @AppStorage("stationSort") private var sort: StationSort
    @State private var search
    @State private var tab

    /// The list's stations: filtered by the search, in the chosen order.
    private var listedStations: [Station] { /* private */ }

    private var tabs: [(tab: NearbyTab, title: String, symbol: String, count: Int?)] { /* private */ }

    var body: some View { /* private */ }

    private func page(_ tab: NearbyTab) -> some View { /* private */ }

    /// A full-width row without the list's background: the summary cards and notes.
    private func plainRow(_ content: some View) -> some View { /* private */ }

    // MARK: Fuel

    @ViewBuilder private var fuelPage: some View { /* private */ }

    @ViewBuilder private var emptyStates: some View { /* private */ }

    private var fuelFooter: some View { /* private */ }

    /// Shown when the newest request failed and older prices stand in.
    private func staleBanner(_ reason: String) -> some View { /* private */ }

    // MARK: Favourites

    @ViewBuilder private var favoritesPage: some View { /* private */ }

    // MARK: Charging

    @ViewBuilder private var chargingPage: some View { /* private */ }

    /// AC and DC each get their own summary and rows: DC is always dearer, so one list would
    /// bury the cheapest fast charger under slow ones.
    @ViewBuilder private func chargerGroup(_ title: LocalizedStringKey, chargers: [ChargePoint], fast: Bool) -> some View { /* private */ }

    private var chargingFooter: some View { /* private */ }
}
