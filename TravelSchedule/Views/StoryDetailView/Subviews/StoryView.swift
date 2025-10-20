//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        Image(story.backgroundColor)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text(story.title)
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                        Text(story.description)
                            .font(.system(size: 20, weight: .regular))
                            .lineLimit(3)
                            .foregroundColor(.white)
                    }
                    .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
                }
            )
        
    }
}

#Preview {
    StoryView(story: .story1)
}
