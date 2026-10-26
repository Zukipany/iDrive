// Source code is private. This file shows only its types and signatures.

import Foundation

/// How the station list is ordered. Remembered between launches.
nonisolated enum StationSort: String, CaseIterable, Identifiable, Sendable {
    case price, distance, openFirst

    var id: Self { /* private */ }

    var label: String { /* private */ }

    var symbol: String { /* private */ }

    func sorted(_ stations: [Station], fuel: FuelType) -> [Station] { /* private */ }

    /// Stations whose brand, name, street or town contains the search, ignoring case and accents.
    static func matching(_ stations: [Station], search: String) -> [Station] { /* private */ }
}
