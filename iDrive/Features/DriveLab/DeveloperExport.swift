// Source code is private. This file shows only its types and signatures.

import CoreTransferable
import Foundation

/// The panel's data as JSON, to look at on a computer. Encoded when the panel builds it, so
/// sharing only hands over bytes.
struct DeveloperExport: Transferable {
    let data: Data

    private struct Payload: Encodable {
        let rides: [Ride]
        let intervals: [ConsumptionEngine.Interval]
        let model: ConsumptionEngine.Model?
        let drivingEffects: [Double]?
    }

    @MainActor
    init(rides: [Ride], report: EngineReport?) { /* private */ }

    static var transferRepresentation: some TransferRepresentation { /* private */ }
}
