// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Observation
import WidgetKit

/// Loads fuel stations (Tankerkönig in Germany, the national databases of Austria, France
/// and Spain) and chargers (MobiData BW, Open Charge Map or OSM) for one map.
/// Each service is called once per location change or pull-to-refresh; the fuel
/// chips filter and sort the results on device without new requests.
@MainActor @Observable
final class MapViewModel {
    enum LoadState: Equatable {
        case idle, loading, loaded
        case failed(String)
    }

    var selectedFuels: Set<FuelType>
    /// The active car's usual fuel: its price goes on the pins when several are selected.
    var preferredFuel: FuelType?
    /// The active car's main fuel: the Home Screen widgets show its best stations, whatever
    /// the chips show. Unlike `preferredFuel`, a Siri request for another fuel doesn't change it.
    var carFuel: FuelType? {
        didSet { /* private */ }
    }
    var radiusKm: Double
    /// The driver's fuel cards: prices shown are after the best discount at each station.
    var discountCards: [DiscountCard] {
        didSet { /* private */ }
    }

    /// The driver's charging plans: charger prices shown are the cheapest of plan and ad-hoc.
    var chargingPlans: [ChargingPlan] {
        didSet { /* private */ }
    }

    private(set) var stations: [Station]
    private(set) var chargers: [ChargePoint]
    private(set) var fuelState: LoadState
    private(set) var chargingState: LoadState
    private(set) var lastUpdate: Date?
    /// Where the chargers came from; drives the attribution text.
    private(set) var chargingSource: ChargePoint.Source?
    /// Why a fallback charger source is in use, or why prices are missing.
    private(set) var chargingNote: String?

    /// Whose prices the list shows; drives the attribution. Nil where no source covers the country.
    private(set) var fuelSource: FuelPriceSource?
    /// The country's name when the app has no fuel prices for it.
    private(set) var unsupportedCountry: String?

    /// True when OpenStreetMap tags confirmed premium-diesel stations; drives the attribution.
    private(set) var premiumUsesOpenStreetMap
    /// Why the fuel prices shown are older than usual (offline, server down); nil when fresh.
    private(set) var fuelStaleBecause: String?
    /// Why favourites' prices couldn't be updated just now.
    private(set) var favoritesNote: String?

    /// OpenStreetMap premium-diesel tags from the last lookup.
    private var premiumTags: [PremiumDiesel.Tag]
    /// Where the last search was: the large widget's map is centred there.
    private var searchPoint: CLLocationCoordinate2D?

    private let fuelService: TankerkoenigService
    private let countryFuelService: CountryFuelService
    private let locator: CountryLocator
    private let chargeService: ChargeMapService
    private let tagService: FuelTagService
    /// Where the averages go that fill-ups compare against.
    private let nearbyPrices: NearbyPrices

    init(
        fuelService: TankerkoenigService = .shared,
        countryFuelService: CountryFuelService = CountryFuelService(),
        locator: CountryLocator = CountryLocator(),
        chargeService: ChargeMapService = ChargeMapService(),
        tagService: FuelTagService = FuelTagService(),
        nearbyPrices: NearbyPrices = .shared
    ) { /* private */ }

    /// A station from elsewhere (a favourite outside the results) with the driver's discounts.
    func withDiscounts(_ station: Station) -> Station { /* private */ }

    // MARK: Derived state

    /// The fuel chips the map offers: Premium only where its prices are real, not estimated.
    var filterFuels: [FuelType] { /* private */ }

    var showsFuel: Bool { /* private */ }
    var showsPremiumDiesel: Bool { /* private */ }

    /// Stations selling a selected fuel. Every station sells E5, E10 or diesel (and
    /// reports them), so with one of those on, all show; with only Premium on, just the
    /// stations known to sell premium diesel.
    var visibleStations: [Station] { /* private */ }
    var showsCharging: Bool { /* private */ }

    /// Fuel used for pins and sorting: the car's usual fuel, else the first selected one.
    var primaryFuel: FuelType { /* private */ }

    /// Selected combustion fuels in a stable order, for compare rows (E5 next to E10, or
    /// diesel next to premium, shows the difference at each station).
    var comparedFuels: [FuelType] { /* private */ }

    var sortedStations: [Station] { /* private */ }
    var stats: StationRanking.PriceStats? { /* private */ }
    var cheapestID: Station.ID? { /* private */ }

    var visibleChargers: [ChargePoint] { /* private */ }

    /// DC fast chargers, cheapest first, then unpriced by distance.
    var fastChargers: [ChargePoint] { /* private */ }
    /// AC chargers, cheapest first, then unpriced by distance.
    var slowChargers: [ChargePoint] { /* private */ }

    /// Cheapest €/kWh among the visible chargers, for the list button.
    var cheapestChargingPrice: Double? { /* private */ }

    func chargerStats(fast: Bool) -> StationRanking.PriceStats? { /* private */ }

    /// Price tier within the charger's own type (AC or DC), for pin borders.
    func tier(for charger: ChargePoint) -> StationRanking.Tier? { /* private */ }

    func tier(for station: Station) -> StationRanking.Tier? { /* private */ }

    // MARK: Loading

    /// Loads only the layers the chips show, so an EV driver never calls Tankerkönig
    /// (its fair-use rules ask for requests on demand only). Both services cache, so
    /// calling this again after a chip change is cheap.
    /// A plug-in hybrid shows both layers; both services then run at the same time.
    func load(at coordinate: CLLocationCoordinate2D, force: Bool = false) async { /* private */ }

    /// True once the visible layers have something to show; used to frame the map once.
    var hasVisibleResults: Bool { /* private */ }

    var isLoadingVisibleLayers: Bool { /* private */ }

    /// Chargers that get a full pin: the 8 cheapest of each type, plus the 5 nearest when
    /// they have no price. About 500 sites lie within 5 km of Marienplatz; more pins overlap.
    var featuredChargerIDs: Set<ChargePoint.ID> { /* private */ }

    /// Everything else drawn as dots: the nearest 150, so the map stays fast.
    var dotChargers: [ChargePoint] { /* private */ }

    var featuredChargers: [ChargePoint] { /* private */ }

    private func loadFuel(at coordinate: CLLocationCoordinate2D, place: CountryLocator.Place?, force: Bool) async { /* private */ }

    /// No prices for this country: an empty list that says so, instead of an error.
    private func showUnsupported(_ regionCode: String?) { /* private */ }

    /// Hands the prices to the widgets and asks them to redraw: the cheapest of the pins' fuel
    /// for the Lock Screen, the best stations for the car's own fuel for the Home Screen.
    private func shareWithWidget() { /* private */ }

    /// The cheapest price of the pins' fuel (Lock Screen widget). False when there's none.
    private func sharePinPrice() -> Bool { /* private */ }

    /// The best stations (or chargers) for the car's fuel (Home Screen widgets). False when
    /// none are loaded, so the widgets keep the last ones.
    private func shareCarPrices() -> Bool { /* private */ }

    // MARK: Favourites

    /// Saves the latest prices on starred stations: from the nearby results when they're in
    /// range, otherwise with one `prices.php` request. Tankerkönig allows one request a
    /// minute, so right after the map loads this waits for the minute to pass.
    func refreshFavorites(_ favorites: [FavoriteStation]) async { /* private */ }

    /// Stations with premium-diesel availability from their brand and OpenStreetMap.
    private func setStations(_ loaded: [Station]) { /* private */ }

    private func loadCharging(at coordinate: CLLocationCoordinate2D, regionCode: String?, force: Bool) async { /* private */ }
}
