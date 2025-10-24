//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class CarriersViewModel: ObservableObject {
    @Published var showCarrierFilters = false
    @Published var selectedCarrier: Carrier?
    
    let fromLocation: Location
    let toLocation: Location
    let carriers: [Carrier]
    
    init(
        fromLocation: Location,
        toLocation: Location,
        carriers: [Carrier] = MockData.carriers
    ) {
        self.fromLocation = fromLocation
        self.toLocation = toLocation
        self.carriers = carriers
    }
    
    func selectCarrier(_ carrier: Carrier) {
        selectedCarrier = carrier
    }
    
    func openFilters() {
        showCarrierFilters = true
    }
}
