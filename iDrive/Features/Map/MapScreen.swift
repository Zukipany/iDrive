// Source code is private. This file shows only its types and signatures.

import MapKit
import SwiftData
import SwiftUI

struct MapScreen: View {
    @Environment(LocationService.self) private var location
    @Query(filter: #Predicate<Vehicle> { }) private var activeVehicles: [Vehicle]
    @Query private var favorites: [FavoriteStation]
    @Environment(\.modelContext) private var context
    @Query(sort: \FuelCard.addedAt) private var fuelCards: [FuelCard]
    @Query(sort: \ChargingCard.addedAt) private var chargingCards: [ChargingCard]

    @State private var model
    @State private var trip
    @State private var showsTrip
    /// The fuel chips' size; collapsing them moves the buttons below up (`MapTopBar`).
    @State private var filterMode
    @Namespace private var mapScope
    @Environment(\.openURL) private var openURL
    @State private var position: MapCameraPosition
    /// Where the camera stopped last: the location button zooms back in from further out.
    @State private var camera: MapCamera?
    @State private var selection: String?
    @State private var showsList
    /// The list button zooms into the sheet it opens.
    @Namespace private var listTransition
    /// Detail pages pushed on the sheet's NavigationStack.
    @State private var sheetPath: [MapDestination]

    private var activeVehicle: Vehicle? { /* private */ }
    private static let pricePinLimit

    /// The active car's fuels and charging the map offers here, in the filter bar's order.
    private var carFuels: [FuelType] { /* private */ }

    var body: some View { /* private */ }

    /// The whole trip in Apple Maps, every stop still ahead as a waypoint (9a).
    private func openRouteInMaps() { /* private */ }

    /// "Find cheap diesel" from Siri: that fuel, and the list sorted by price. A station
    /// tapped in a widget: its page, with its fuel's chip on.
    private func applyRequest(_ request: AppRouter.Request?) { /* private */ }

    @ViewBuilder private func detail(for destination: MapDestination) -> some View { /* private */ }

    private func coordinate(of destination: MapDestination) -> CLLocationCoordinate2D? { /* private */ }

    /// Centres the place in the part of the map the half-height sheet leaves visible.
    private func focus(on coordinate: CLLocationCoordinate2D) { /* private */ }

    /// Floating controls above the tab bar: a glass button for the list plus the
    /// required data attribution (links per the Tankerkönig, OCM and OSM licences).
    private var bottomBar: some View { /* private */ }

    /// LocalizedStringKey, not String: only Text applies the ^[…](inflect: true) grammar agreement.
    private var listButtonTitle: LocalizedStringKey { /* private */ }
}

/// What the map loads for: a new location or a layer switched on.
private struct LoadTrigger: Equatable {
    let location: CLLocation?
    let fuel: Bool
    let charging: Bool
    /// Premium on: the OpenStreetMap tags are loaded too.
    let premium: Bool
}

/// Small charger marker for crowded areas, with a 44 pt hit target.
private struct ChargerDot: View {
    let charger: ChargePoint

    var body: some View { /* private */ }
}
