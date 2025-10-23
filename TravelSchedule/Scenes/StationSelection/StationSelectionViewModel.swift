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
    
    let stations = [
        "Киевский вокзал", "Курский вокзал", "Ярославский вокзал",
        "Белорусский вокзал", "Савеловский вокзал", "Ленинградский вокзал"
    ]
    
    var searchResults: [String] {
        if searchQuery.isEmpty {
            stations
        } else {
            stations.filter { $0.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}

