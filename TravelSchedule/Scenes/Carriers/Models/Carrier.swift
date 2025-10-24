//
//  Carrier.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import Foundation

struct Carrier: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let date: String
    let fromTime: String
    let toTime: String
}
