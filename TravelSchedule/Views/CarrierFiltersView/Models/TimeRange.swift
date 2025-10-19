//
//  TimeRange.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import Foundation

enum TimeRange: CaseIterable, Hashable {
    case morning, day, evening, night
    
    var title: String {
        switch self {
            case .morning: "Утро 06:00 – 12:00"
            case .day: "День 12:00 – 18:00"
            case .evening: "Вечер 18:00 – 00:00"
            case .night: "Ночь 00:00 – 06:00"
        }
    }
}
