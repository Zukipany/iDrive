// Source code is private. This file shows only its types and signatures.

import Foundation

/// A trip said in words: "tomorrow morning I'm heading to Milan", "morgen früh fahre ich von
/// Augsburg nach Mailand", "drive to Venice on Friday at 7:30".
nonisolated struct TripRequest: Equatable, Sendable {
    let destination: String
    /// Nil: from wherever the driver is (also for "from here", "from my location").
    let start: String?
    let departure: Date
}

/// Reads trip requests in English and German without the language model, so saying a trip
/// works on every iPhone and the rules are testable. Anything it can't read clearly goes to
/// Apple Intelligence instead (the assistant's trip tool).
nonisolated enum TripRequestParser {
    /// Without a time: this hour on another day, a few minutes from now today.
    static let defaultHour

    /// A trip needs one of these; "go to Garage" or "how much to fill up" aren't trips.
    private static let travelWords
    /// Words that end a place name.
    private static let stopWords: Set<String>
    private static let hereWords

    static func parse(_ text: String, now: Date = .now, calendar: Calendar = .current) -> TripRequest? { /* private */ }

    /// The words after the first of `markers` up to a stop word, in title case: "to new york tomorrow" → "New York".
    private static func place(after markers: [String], in words: [String]) -> String? { /* private */ }

    // MARK: When

    static func departure(_ words: [String], lower: String, now: Date, calendar: Calendar) -> Date { /* private */ }

    private static func weekday(in words: [String]) -> Int? { /* private */ }

    /// "at 7:30", "um 19 uhr", "7pm", "7 am".
    private static func clock(_ words: [String], lower: String) -> (hour: Int, minute: Int)? { /* private */ }

    private static func partOfDay(_ words: [String], lower: String) -> (hour: Int, minute: Int)? { /* private */ }
}
