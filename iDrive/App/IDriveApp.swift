// Source code is private. This file shows only its types and signatures.

import SwiftData
import SwiftUI

@main
struct IDriveApp: App {
    @State private var location
    @Environment(\.scenePhase) private var scenePhase

    init() { /* private */ }

    var body: some Scene { /* private */ }

    /// The cars and fill-ups, in the app's own container. Not the App Group (SwiftData's
    /// default when the app has one): the widget only needs the shared price snapshot, and
    /// the store must stay in one place whether or not a build has the App Group.
    @MainActor
    private static func activeCar() -> Vehicle? { /* private */ }

    /// The car with this `reminderID`, or the active car for nil.
    @MainActor
    private static func car(_ id: String?) -> Vehicle? { /* private */ }

    private static let store: ModelContainer
}

#if DEBUG
    /// Launch arguments for demos and screenshots (Scheme > Run > Arguments):
    ///   -seedSampleData YES   loads the sample garage when the store is empty
    ///   -activeCar "Plug-in"  makes the car with that name active
    ///   -demoTankFill e10     plays the tank-fill animation (see RootTabView)
    ///   -addDemoCar petrol    adds a demo car with 6 months of fill-ups (diesel, hybrid, all)
    private struct DebugLaunchOptions: ViewModifier {
        @Environment(\.modelContext) private var context

        func body(content: Content) -> some View { /* private */ }
    }
#endif
