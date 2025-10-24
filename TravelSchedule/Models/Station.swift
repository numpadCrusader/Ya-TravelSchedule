//
//  Station.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.10.2025.
//

import Foundation

struct Station: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let code: String
}
