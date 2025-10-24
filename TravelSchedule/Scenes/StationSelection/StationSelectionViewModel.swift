//
//  StationSelectionViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class StationSelectionViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    private let stations: [Station]
    
    init(stations: [Station]) {
        self.stations = stations
    }
    
    var searchResults: [Station] {
        if searchQuery.isEmpty {
            stations
        } else {
            stations.filter { $0.title.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}
