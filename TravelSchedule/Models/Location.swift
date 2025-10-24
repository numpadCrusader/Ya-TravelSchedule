//
//  Location.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.10.2025.
//

import Foundation

struct Location {
    let city: City
    let station: Station
    
    var description: String {
        "\(city.title) (\(station.title))"
    }
}
