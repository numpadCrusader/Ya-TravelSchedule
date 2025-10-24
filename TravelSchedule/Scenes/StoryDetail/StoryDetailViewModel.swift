//
//  StoryDetailViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import SwiftUI
import Combine

@MainActor
final class StoryDetailViewModel: ObservableObject {
    @Published var currentStoryIndex: Int
    let stories: [Story]
    
    init(stories: [Story], initialIndex: Int = 0) {
        self.stories = stories
        self.currentStoryIndex = initialIndex
    }
}
