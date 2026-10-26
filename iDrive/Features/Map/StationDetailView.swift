// Source code is private. This file shows only its types and signatures.

import CoreLocation
import SwiftData
import SwiftUI

/// A fuel station: all three prices, open or closed, what a full tank costs, and
/// directions in Apple Maps. Prices come from the same `list.php` call as the map,
/// so opening this page makes no extra Tankerkönig request.
struct StationDetailView: View {
    let station: Station
    let model: MapViewModel
    let origin: CLLocationCoordinate2D?
    let tankLiters: Double?

    @Environment(\.modelContext) private var context
    @Query private var favorites: [FavoriteStation]

    private var favorite: FavoriteStation? { /* private */ }

    var body: some View { /* private */ }

    private var placeSection: some View { /* private */ }

    private var pricesSection: some View { /* private */ }

    /// What filling the car's empty tank costs here, against the average nearby.
    @ViewBuilder private var fullTankSection: some View { /* private */ }

    private func priceRow(_ fuel: FuelType) -> some View { /* private */ }

    /// Where the premium information comes from and why its price is an estimate.
    private func premiumNote(_ premium: PremiumDiesel.Availability) -> String { /* private */ }
}
