// Source code is private. This file shows only its types and signatures.

import Foundation

/// Shared networking for all APIs.
/// - Sends a User-Agent: OpenStreetMap's Overpass servers reject anonymous clients (HTTP 406).
/// - Turns non-2xx responses into `HTTPError`, so a 403 from Open Charge Map shows
///   "The server rejected the API key" instead of a JSON decoding error.
nonisolated enum HTTP {
    typealias Fetcher = @Sendable (URLRequest) async throws -> Data

    static let userAgent: String

    static func data(for request: URLRequest) async throws -> Data { /* private */ }
}

nonisolated extension URL {
    /// One of the app's fixed API addresses. They're constants, and the API tests build
    /// every request from them, so an invalid one is a programming error.
    init(constant address: StaticString) { /* private */ }
}

nonisolated struct HTTPError: LocalizedError, Equatable {
    let status: Int
    /// First 300 bytes of the response, for debugging. Never shown to users.
    let body: String

    var errorDescription: String? { /* private */ }
}
