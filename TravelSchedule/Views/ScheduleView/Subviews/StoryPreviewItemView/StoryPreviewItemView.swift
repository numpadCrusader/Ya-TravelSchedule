//
//  StoryPreviewItemView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryPreviewItemView: View {
    let story: StoryPreviewItem
    let isWatched: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(story.imageResource)
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .opacity(isWatched ? 0.5 : 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(isWatched ? .clear : .ypBlueUniversal, lineWidth: 4)
                )
            
            Text(story.username)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypWhiteUniversal)
                .lineLimit(3)
                .truncationMode(.tail)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
        }
        .frame(width: 92, height: 140)
        .contentShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    StoryPreviewItemView(
        story: StoryPreviewItem(
            username: "Text Text Text Text Text Text Text Text Text",
            imageResource: .imStoryBackground1
        ),
        isWatched: false
    )
}
