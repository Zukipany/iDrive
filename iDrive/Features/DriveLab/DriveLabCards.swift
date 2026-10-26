// Source code is private. This file shows only its types and signatures.

import SwiftUI

/// The recorder now: off, watching, or recording live (distance, time, speed, which car).
struct RecorderCard: View {
    let activeCar: Vehicle?
    private var recorder
    private var connection
    @AppStorage(RideRecorder.enabledKey) private var isEnabled

    init(activeCar: Vehicle?) { /* private */ }

    var body: some View { /* private */ }

    private func live(_ ride: Ride) -> some View { /* private */ }
}

/// Which car the iPhone is connected to, the links, and how to start drives automatically.
struct ConnectionCard: View {
    let vehicles: [Vehicle]
    private var connection
    @Environment(\.openURL) private var openURL

    init(vehicles: [Vehicle]) { /* private */ }

    var body: some View { /* private */ }

    /// The simulator has no car audio.
    static let demoPort

    @ViewBuilder private var current: some View { /* private */ }

    private func linkMenu(_ port: CarConnection.Port, linked: Vehicle?) -> some View { /* private */ }

    private var links: some View { /* private */ }

    private var automation: some View { /* private */ }
}
