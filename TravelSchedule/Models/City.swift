//
//  City.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.10.2025.
//

import Foundation

struct City: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let stations: [Station]
}
