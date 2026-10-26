// Source code is private. This file shows only its types and signatures.

import AuthenticationServices
import SwiftUI

/// "Connected Car": links the active car to its maker's account through Smartcar, then shows
/// what the car itself reports (odometer, tank, range). The login happens on Smartcar's page
/// with the brand's own account; iDrive never sees the password.
struct ConnectedCarSection: View {
    let vehicle: Vehicle
    private var service
    @Environment(\.webAuthenticationSession) private var webAuthenticationSession
    @State private var isConnecting
    @State private var choices: (userID: String, cars: [SmartcarAPI.Vehicle])?
    @State private var errorText: String?
    @State private var confirmsUnlink

    init(vehicle: Vehicle) { /* private */ }

    var body: some View { /* private */ }

    private var footer: String { /* private */ }

    private var connectButton: some View { /* private */ }

    @ViewBuilder private func linked(_ link: CarDataService.Link) -> some View { /* private */ }

    private var refreshButton: some View { /* private */ }

    private func figure(_ title: LocalizedStringKey, _ value: String?) -> some View { /* private */ }

    /// The level as the car's own gauge: a bar and the percentage.
    private func tank(_ level: Double?, electric: Bool) -> some View { /* private */ }

    /// Smartcar Connect in the system's login sheet, back through `sc<application ID>://exchange`.
    private func connect() async { /* private */ }
}
