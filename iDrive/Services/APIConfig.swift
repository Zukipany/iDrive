// Source code is private. This file shows only its types and signatures.

import Foundation

/// API keys injected at build time: Config.xcconfig / Secrets.xcconfig → Info.plist → here.
/// A key inside an app binary can still be extracted. That's acceptable for a course app;
/// a public release should route requests through a small backend.
nonisolated enum APIConfig {
    static let tankerkoenigDemoKey

    static var tankerkoenigKey: String { /* private */ }
    static var openChargeMapKey: String { /* private */ }
    /// Optional: without it, US and Canadian chargers use NREL's DEMO_KEY (10 requests an hour).
    static var nrelKey: String { /* private */ }

    /// The demo key returns fake prices; the UI says so.
    static var usesTankerkoenigDemoKey: Bool { /* private */ }

    static func value(for key: String) -> String { /* private */ }
}
