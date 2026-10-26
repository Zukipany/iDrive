// Source code is private. This file shows only its types and signatures.

import AVFoundation
import CoreLocation
import Foundation
import FoundationModels
import Observation
import Speech

/// One conversation with the on-device model. Answers stream in as they're written.
@MainActor @Observable
final class AssistantChat {
    struct Message: Identifiable, Equatable {
        let id
        let fromUser: Bool
        var text: String
    }

    private(set) var messages: [Message]
    private(set) var isResponding
    @ObservationIgnored private var session: LanguageModelSession?
    @ObservationIgnored private var near: CLLocationCoordinate2D?

    /// - Parameter near: the driver's location: a trip said without a start leaves from here.
    func send(_ text: String, near: CLLocationCoordinate2D? = nil, facts: @autoclosure () -> String) async { /* private */ }

    func reset() { /* private */ }

    private func stream(_ question: String, into index: Int, instructions: String) async throws { /* private */ }
}

/// Speech to text for the assistant, on the device when the iPhone supports it. Stops by
/// itself after a short pause, so a question can be asked hands-free.
@MainActor @Observable
final class SpeechInput {
    private(set) var isListening
    private(set) var transcript
    private(set) var problem: String?
    /// True when listening stopped because the speaker paused (not by a tap).
    private(set) var finishedSpeaking

    @ObservationIgnored private var microphone: MicrophoneFeed?
    @ObservationIgnored private var task: SFSpeechRecognitionTask?
    @ObservationIgnored private var pauseTimer: Task<Void, Never>?

    func start() async { /* private */ }

    func stop() { /* private */ }

    private func update(text: String?, isFinal: Bool) { /* private */ }

    private static func authorize() async -> Bool { /* private */ }

    /// Nonisolated: results arrive on a background queue, then hop to the main actor.
    nonisolated private static func recognize(
        _ request: SFSpeechAudioBufferRecognitionRequest,
        with recognizer: SFSpeechRecognizer,
        onResult: @escaping @MainActor @Sendable (String?, Bool) -> Void
    ) -> SFSpeechRecognitionTask { /* private */ }
}

/// The microphone as sample buffers for speech recognition. AVCaptureSession runs on its
/// own queue; the buffers go straight to the request, never through the main actor.
nonisolated private final class MicrophoneFeed: NSObject, AVCaptureAudioDataOutputSampleBufferDelegate, @unchecked Sendable {
    private let session
    private let queue
    private let request: SFSpeechAudioBufferRecognitionRequest

    init?(feeding request: SFSpeechAudioBufferRecognitionRequest) { /* private */ }

    func start() { /* private */ }

    func stop() { /* private */ }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) { /* private */ }
}
