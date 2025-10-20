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
    @State var currentStoryIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(stories: stories)
            
            CloseButton {
                dismiss()
            }
            .padding(.top, 50)
            .padding(.trailing, 12)
        }
        .background(.ypBlackUniversal)
    }
}
