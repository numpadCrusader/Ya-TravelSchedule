//
//  StoryCarouselView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryCarouselView: View {
    let stories: [StoryCarouselItem] = MockData.storyCarouselItems
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(stories) { story in
                    StoryCarouselItemView(story: story)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 188)
    }
}

#Preview {
    StoryCarouselView()
}
