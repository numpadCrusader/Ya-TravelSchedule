//
//  StoryDetailView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let stories: [Story]
    let initialIndex: Int
    @State var currentStoryIndex: Int = 0
    
    init(stories: [Story], initialIndex: Int = 0) {
        self.stories = stories
        self.initialIndex = initialIndex
        _currentStoryIndex = State(initialValue: initialIndex)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(stories: stories, currentStoryIndex: currentStoryIndex)
            
            CloseButton {
                dismiss()
            }
            .padding(.top, 50)
            .padding(.trailing, 12)
        }
        .background(.ypBlackUniversal)
    }
}
