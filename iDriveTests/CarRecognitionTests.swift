// Source code is private. This file shows only its types and signatures.

import Foundation
import Testing
@testable import iDrive

@Suite("Recognising the car from CarPlay and Bluetooth")
@MainActor
struct CarRecognitionTests {
    private let golf
    private let x5
    private let cClass

    private func defaults() throws -> UserDefaults { /* private */ }

    @Test("Cars name their connection after the brand: BMW, VW, MB")
    func matching() { /* private */ }

    @Test("CarPlay is always a car; Bluetooth only once linked; links are kept")
    func linking() throws { /* private */ }

    @Test("Links made in the old developer panel move over")
    func migration() throws { /* private */ }

    @Test("Without an engine report a drive gets no estimate")
    func estimates() throws { /* private */ }
}
