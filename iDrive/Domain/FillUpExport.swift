// Source code is private. This file shows only its types and signatures.

import CoreTransferable
import Foundation
import UniformTypeIdentifiers

/// The fill-ups of one car as a CSV file, for a spreadsheet or a company-car report.
/// Semicolon-separated with decimal commas when the locale uses them (as German Excel
/// expects); a comma otherwise.
nonisolated struct FillUpExport: Transferable, Sendable {
    let carName: String
    let rows: [Row]
    let decimalSeparator: String

    struct Row: Sendable, Equatable {
        let date: Date
        let fuel: String
        let amount: Double
        let unit: String
        let pricePerUnit: Double
        let total: Double
        let odometer: Int
        let isFullTank: Bool
        let tankLevelAfter: Double?
        let station: String?
        /// The consumption this fill-up showed, if it gave a reading.
        let per100km: Double?
    }

    init(carName: String, rows: [Row], locale: Locale = .current) { /* private */ }

    private var separator: String { /* private */ }

    var csv: String { /* private */ }

    var fileName: String { /* private */ }

    private func number(_ value: Double, _ digits: Int) -> String { /* private */ }

    /// Text a spreadsheet would run as a formula ("=HYPERLINK(…)", "+1", "@SUM") gets a
    /// leading apostrophe, so a station name typed or sent by an API stays text (OWASP
    /// CSV injection).
    static func neutralized(_ text: String) -> String { /* private */ }

    /// Quotes a field that contains the separator, a quote or a line break.
    private func escape(_ field: String) -> String { /* private */ }

    static var transferRepresentation: some TransferRepresentation { /* private */ }
}

nonisolated extension ISO8601DateFormatter {
    static func string(from date: Date, timeZone: TimeZone, formatOptions: ISO8601DateFormatter.Options) -> String { /* private */ }
}
