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
    let code: Int
    let logoUrl: String
    let departureDay: String
    let departureTime: String
    let arrivalTime: String
    let routeDuration: Int
    let hasTransfer: Bool
}
