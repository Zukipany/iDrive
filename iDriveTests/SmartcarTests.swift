// Source code is private. This file shows only its types and signatures.

import Foundation
import Testing
@testable import iDrive

@Suite("Smartcar: the car's own mileage and tank")
@MainActor
struct SmartcarTests {
    private let applicationID

    @Test("Connect asks for mileage, tank and battery and comes back to sc<application ID>://exchange")
    func connectURL() throws { /* private */ }

    @Test("The redirect: the owner's id, a refusal, or someone else's login")
    func callback() throws { /* private */ }

    @Test("Signals in the car's units become km, litres and percent; failed signals are skipped")
    func reading() throws { /* private */ }

    @Test("Litres over the tank when no percentage; 0…1 shares read as shares")
    func levels() { /* private */ }

    @Test("The owner's cars from the connections list")
    func vehicles() throws { /* private */ }

    @Test("Linking reads the car at once; afterwards at most every 30 minutes unless pulled")
    func service() async throws { /* private */ }
}

/// One v3 signal as Smartcar sends it.
private func signal(
    _ code: String,
    _ value: Double,
    _ unit: String,
    status: String = "SUCCESS",
    oemUpdatedAt: String? = nil,
    retrievedAt: String? = nil
) -> String { /* private */ }

private func page(_ signals: [String]) -> Data { /* private */ }

private actor FakeBackend: SmartcarBackend {
    private(set) var readings

    func vehicles(userID: String) async throws -> [SmartcarAPI.Vehicle] { /* private */ }

    func reading(vehicleID: String, userID: String) async throws -> CarReading { /* private */ }
}
