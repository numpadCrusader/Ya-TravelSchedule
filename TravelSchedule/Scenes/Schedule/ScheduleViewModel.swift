//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 22.10.2025.
//

import Foundation
import Combine

@MainActor
final class ScheduleViewModel: ObservableObject {
    @Published var fromLocation: String?
    @Published var toLocation: String?
    @Published var selectedPickerType: PickerType?
    @Published var showCitySelection = false
    @Published var showCarriers = false
    @Published var selectedStory: Story?
    
    let stories = MockData.stories
    
    func selectFrom() {
        selectedPickerType = .fromLocation
        showCitySelection = true
    }
    
    func selectTo() {
        selectedPickerType = .toLocation
        showCitySelection = true
    }
    
    func handleCitySelection(city: String, station: String) {
        let location = "\(city) (\(station))"
        if selectedPickerType == .fromLocation {
            fromLocation = location
        } else {
            toLocation = location
        }
        showCitySelection = false
    }
    
    func search() {
        guard fromLocation != nil, toLocation != nil else { return }
        showCarriers = true
    }
}
