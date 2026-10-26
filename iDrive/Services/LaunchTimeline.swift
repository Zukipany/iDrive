// Source code is private. This file shows only its types and signatures.

import Darwin
import Foundation
import os

/// How long launching takes, step by step: each step once, in milliseconds
/// since the process started (so loading the app before `main` counts too). Read it in
/// Console.app (subsystem com.christo.idrive, category "launch") or with `log show`.
enum LaunchTimeline {
    private static let log
    private static var marked: Set<String>

    /// Debug builds; release builds with the launch argument `-launchTimeline YES`.
    private static let isOn: Bool

    static func mark(_ step: String, _ detail: String = "") { /* private */ }

    /// Seconds since the kernel started this process.
    nonisolated static var sinceProcessStart: Double { /* private */ }
}
