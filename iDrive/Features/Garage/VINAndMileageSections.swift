// Source code is private. This file shows only its types and signatures.

import PhotosUI
import SwiftUI

/// The mileage, typed or read from a photo of the dashboard.
struct MileageSection: View {
    @Bindable var draft: VehicleDraft
    /// The last fill-up's reading: lower numbers on the dashboard are trip meters.
    let minimumOdometer: Int?

    @State private var choices: [Int]
    @State private var message: String?
    @State private var isReading

    var body: some View { /* private */ }

    private func read(_ image: UIImage) { /* private */ }
}

/// The VIN: typed or read from a photo of the registration certificate, decoded offline,
/// with a link to a history check.
struct VINSection: View {
    @Bindable var draft: VehicleDraft

    @FocusState private var isEditing: Bool
    @State private var result: Result<VINDecoder.Info, VINDecoder.Problem>?
    @State private var choices: [String]
    @State private var message: String?
    @State private var isReading
    @State private var historyPage: WebPage?

    private var isReadable: Bool { /* private */ }

    var body: some View { /* private */ }

    private var entryRow: some View { /* private */ }

    @ViewBuilder private var resultRow: some View { /* private */ }

    private func decode() { /* private */ }

    private func readPhoto(_ image: UIImage) { /* private */ }

    private func text(for problem: VINDecoder.Problem) -> String { /* private */ }
}

/// "Take Photo" or "Choose Photo", then hands the image over: the dashboard for the
/// mileage, the registration certificate for the VIN.
struct ScanPhotoMenu: View {
    let title: LocalizedStringKey
    let systemImage: String
    let onImage: (UIImage) -> Void

    @State private var showsCamera
    @State private var showsPicker
    @State private var item: PhotosPickerItem?

    var body: some View { /* private */ }

    private func load(_ newItem: PhotosPickerItem?) { /* private */ }
}
