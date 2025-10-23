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
    @Published var selectedCity: String?
    
    let cities = [
        "Москва", "Санкт Петербург", "Сочи", "Горный воздух",
        "Краснодар", "Казань", "Омск"
    ]
    
    var searchResults: [String] {
        if searchQuery.isEmpty {
            cities
        } else {
            cities.filter { $0.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    func select(city: String) {
        selectedCity = city
    }
}
