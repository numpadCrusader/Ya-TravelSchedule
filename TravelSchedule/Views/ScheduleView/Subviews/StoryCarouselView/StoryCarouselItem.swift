//
//  StoryCarouselItem.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryCarouselItem: Identifiable {
    let id = UUID()
    let title: String
    let imageResource: ImageResource
    let isWatched: Bool
}
