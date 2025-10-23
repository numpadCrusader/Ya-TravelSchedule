//
//  CarrierFiltersViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class CarrierFiltersViewModel: ObservableObject {
    @Published var selectedTimes: Set<TimeRange> = []
    @Published var showTransfers: Bool?
    
    var canApply: Bool {
        !selectedTimes.isEmpty && showTransfers != nil
    }
    
    func toggleTimeRange(_ range: TimeRange) {
        if selectedTimes.contains(range) {
            selectedTimes.remove(range)
        } else {
            selectedTimes.insert(range)
        }
    }
    
    func setShowTransfers(_ value: Bool) {
        showTransfers = value
    }
}
