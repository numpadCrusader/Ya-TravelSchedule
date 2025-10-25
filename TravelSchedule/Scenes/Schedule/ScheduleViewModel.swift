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
    @Published var fromLocation: Location?
    @Published var toLocation: Location?
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
    
    func handleCitySelection(city: City, station: Station) {
        if selectedPickerType == .fromLocation {
            fromLocation = .init(city: city, station: station)
        } else {
            toLocation = .init(city: city, station: station)
        }
        showCitySelection = false
    }
    
    func search() {
        guard fromLocation != nil, toLocation != nil else { return }
        showCarriers = true
    }
}
