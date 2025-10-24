//
//  CitySelectionViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class CitySelectionViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var selectedCity: City?
    
    var cities = MockData.cities
    
    var searchResults: [City] {
        if searchQuery.isEmpty {
            cities
        } else {
            cities.filter { $0.title.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    func select(city: City) {
        selectedCity = city
    }
}
