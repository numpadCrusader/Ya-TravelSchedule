//
//  StoryDetailView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct StoryDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: StoryDetailViewModel
    
    init(stories: [Story], initialIndex: Int = 0) {
        _viewModel = StateObject(
            wrappedValue: StoryDetailViewModel(stories: stories, initialIndex: initialIndex)
        )
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(
                stories: viewModel.stories,
                currentStoryIndex: viewModel.currentStoryIndex
            )
            
            CloseButton {
                dismiss()
            }
            .padding(.top, 50)
            .padding(.trailing, 12)
        }
        .background(.ypBlackUniversal)
    }
}
