// Source code is private. This file shows only its types and signatures.

import Foundation
import Observation

/// The car being added or edited, before it's saved. Holds the form's values and the rules
/// that connect them (a car tanks one kind of fuel, suggestions fill in several fields), so
/// the form's sections stay small and the rules can be unit-tested.
@Observable
final class VehicleDraft {
    var name
    var make
    var modelName
    /// The exact version ("xDrive40d"); filled in by a catalogue version, or typed.
    var version
    var year: Int?
    var generationID: String?
    var vin

    var kind: FuelType.Kind
    /// The fuels of `kind` this car tanks; at least one unless it's electric.
    var fuels: Set<FuelType>
    /// The usual fuel: map prices and new fill-ups start with it.
    var mainFuel: FuelType
    var isPlugInHybrid
    var tank: Double?
    var battery: Double?
    var consumption: Double?
    /// A plug-in hybrid's kWh/100 km on electricity.
    var electricConsumption: Double?

    var bodyType: BodyType?
    var carColor: CarColor?
    var photoData: Data?
    var odometer: Int?
    var inspectionDue: Date?
    var serviceDue: Date?
    /// The car (make, model, year, generation) whose suggestion was used. Suggestions stay
    /// hidden until one of those changes, so they don't ask again for the same car.
    var usedSuggestionFor: String?

    @ObservationIgnored private let catalog

    var isElectric: Bool { /* private */ }

    /// Selected fuels in the kind's order (E10 before E5, diesel before premium).
    var chosenFuels: [FuelType] { /* private */ }

    /// The chosen generation, else the one matching make, model and year.
    var catalogCar: CarCatalog.Car? { /* private */ }

    var hasMakeAndModel: Bool { /* private */ }

    var isValid: Bool { /* private */ }

    /// Changes when the user picks another make, model, year or generation.
    var suggestionKey: String { /* private */ }

    var showsSuggestions: Bool { /* private */ }

    // MARK: Changes

    /// Everything the user can change, to tell whether the form was edited.
    struct Snapshot: Equatable {
        var text: [String]
        var numbers: [Double?]
        var isPlugInHybrid: Bool
        var photoSize: Int?
    }

    var snapshot: Snapshot { /* private */ }

    // MARK: Energy rules

    /// Ticks or unticks a fuel. The last one can't be unticked: a car needs a fuel.
    func toggle(_ fuel: FuelType) { /* private */ }

    /// A new engine kind starts with its usual fuel; the same kind keeps the selection.
    func setKind(_ newKind: FuelType.Kind, plugInHybrid: Bool? = nil) { /* private */ }

    private func setEnergy(_ energy: CarCatalog.Variant.Fuel) { /* private */ }

    private func nameIfEmpty(_ suggestion: String) { /* private */ }

    // MARK: Suggestions

    /// Typical values of a catalogue model.
    func apply(_ variant: CarCatalog.Variant, of car: CarCatalog.Car) { /* private */ }

    /// Body style and energy from Apple Intelligence; they're usually right.
    func applyKind(_ specs: CarAssistant.Specs) { /* private */ }

    /// Tank, battery and consumption from Apple Intelligence: a rough estimate.
    func applyFigures(_ specs: CarAssistant.Specs) { /* private */ }

    /// What Apple Intelligence recognised in the car's photo.
    func applyIdentity(_ identity: CarAssistant.CarIdentity) { /* private */ }

    /// Make, model and year decoded from the VIN.
    func applyVIN(_ info: VINDecoder.Info) { /* private */ }

    // MARK: Saved car

    func load(from vehicle: Vehicle) { /* private */ }

    /// The fuel the car is saved with: the usual one, or AC charging for an electric car.
    var savedFuelType: FuelType { /* private */ }

    func write(to target: Vehicle) { /* private */ }
}
