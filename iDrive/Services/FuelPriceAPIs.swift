// Source code is private. This file shows only its types and signatures.

import CoreLocation
import Foundation

/// Austria: E-Control's Spritpreisrechner API (no key). One request per fuel; by law it
/// returns the 10 cheapest open stations near a point and prices for the 5 cheapest.
nonisolated enum EControlAPI {
    /// "DIE" diesel, "SUP" Super 95 (E5 in Austria). "GAS" (CNG) isn't a map fuel.
    static let fuelCodes: [(code: String, fuel: FuelType)]

    static func request(_ coordinate: CLLocationCoordinate2D, fuelCode: String) -> URLRequest { /* private */ }

    private struct Record: Decodable {
        struct Location: Decodable {
            let address: String?
            let city: String?
            let latitude: Double
            let longitude: Double
        }

        struct Price: Decodable {
            let fuelType: String
            let amount: Double
        }

        struct Hours: Decodable {
            let day: String
            let from: String
            let to: String
        }

        let id: Int
        let name: String
        let location: Location
        let open: Bool?
        let prices: [Price]?
        let openingHours: [Hours]?
    }

    /// One station per id from the per-fuel lists, nearest first.
    static func decode(_ lists: [Data], origin: CLLocationCoordinate2D) throws -> [Station] { /* private */ }
}

/// France: "Prix des carburants en France – flux instantané v2" on data.economie.gouv.fr
/// (no key, Licence Ouverte 2.0). Stations report each price change; the feed refreshes
/// every 10 minutes. It has no brand names, so a station is named by its street.
nonisolated enum PrixCarburantsAPI {
    /// The API's page size limit; a 25 km radius around Paris has fewer stations.
    static let maxResults
    /// Prices last changed more than this long ago are left out: some stations stop
    /// selling a fuel without withdrawing its price.
    static let maxPriceAge: TimeInterval

    static func request(_ coordinate: CLLocationCoordinate2D, radiusKm: Double) -> URLRequest { /* private */ }

    private struct Response: Decodable {
        let results: [Record]
    }

    private struct Record: Decodable {
        struct Geometry: Decodable {
            let lon: Double
            let lat: Double
        }

        let id: Int
        let adresse: String?
        let ville: String?
        let geom: Geometry?
        let gazolePrix: Double?
        let gazoleMaj: Date?
        let sp95Prix: Double?
        let sp95Maj: Date?
        let e10Prix: Double?
        let e10Maj: Date?
    }

    static func decode(_ data: Data, origin: CLLocationCoordinate2D, now: Date) throws -> [Station] { /* private */ }
}

nonisolated enum FuelPriceGeometry {
    /// Straight-line distance in km, for sources that don't send one.
    static func km(from origin: CLLocationCoordinate2D, _ latitude: Double, _ longitude: Double) -> Double { /* private */ }
}
