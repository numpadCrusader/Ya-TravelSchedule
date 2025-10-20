//
//  StoryCarouselView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryCarouselView: View {
    let stories: [Story]
    let onSelect: (Story) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(stories) { story in
                    Button {
                        onSelect(story)
                    } label: {
                        StoryCarouselItemView(story: story)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 188)
    }
}

#Preview {
    StoryCarouselView(stories: MockData.stories) { _ in }
}
