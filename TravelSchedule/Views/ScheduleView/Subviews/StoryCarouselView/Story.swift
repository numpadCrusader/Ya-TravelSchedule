//
//  Story.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct Story: Identifiable {
    let id: Int
    let title: String
    let description: String
    let imageResource: ImageResource
    let isWatched: Bool
}
