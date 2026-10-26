// Source code is private. This file shows only its types and signatures.

import PhotosUI
import SwiftData
import SwiftUI

/// What the fill-up form starts with: empty, or values read from a receipt.
struct FillUpDraft: Identifiable {
    let id
    var receipt: ParsedReceipt?
    var image: UIImage?
    /// From a trip stop (9c): the station and the price the plan expected.
    var stationName: String?
    var pricePerUnit: Double?
    var fuel: FuelType?
}

/// Ways to add a fill-up, shared by the Spending screen's toolbar and empty state.
@MainActor @Observable
final class FillUpCapture {
    var draft: FillUpDraft?
    var showsCamera
    var showsPhotoPicker
    var photoItem: PhotosPickerItem?
    var isReadingReceipt
    var savedCount

    func startScan() { /* private */ }

    func enterManually() { /* private */ }

    func read(_ image: UIImage) { /* private */ }

    func readPicked() { /* private */ }
}

extension View {
    /// The camera, photo picker, "Reading receipt…" overlay and fill-up form for `capture`.
    func fillUpCapture(_ capture: FillUpCapture, vehicle: Vehicle?) -> some View { /* private */ }
}

private struct FillUpCaptureModifier: ViewModifier {
    @Bindable var capture: FillUpCapture
    let vehicle: Vehicle?
    /// Optional so previews without the root view still work.
    @Environment(TankFillPresenter.self) private var tankFill: TankFillPresenter?

    func body(content: Content) -> some View { /* private */ }
}

/// One fill-up in the history list.
struct FillUpRow: View {
    let fillUp: FillUp

    var body: some View { /* private */ }

    private var detail: String { /* private */ }
}
