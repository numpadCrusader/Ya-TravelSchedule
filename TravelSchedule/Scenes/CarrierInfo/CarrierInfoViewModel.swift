//
//  CarrierInfoViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class CarrierInfoViewModel: ObservableObject {
    @Published var carrierName: String
    @Published var contacts: [Contact]
    
    init(
        carrierName: String,
        contacts: [Contact]
    ) {
        self.carrierName = carrierName
        self.contacts = contacts
    }
}
