//
//  StoryDetailView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryDetailView: View {
    let stories: [Story]
    @State var currentStoryIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(stories: stories)
            CloseButton(action: { print("Close Story") })
                .padding(.top, 57)
                .padding(.trailing, 12)
        }
    }
}
