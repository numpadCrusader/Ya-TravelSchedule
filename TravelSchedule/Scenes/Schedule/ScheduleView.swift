//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    var body: some View {
        VStack {
            StoryCarouselView(stories: viewModel.stories) { story in
                viewModel.selectedStory = story
            }
            
            RoutePicker(
                fromLocation: $viewModel.fromLocation,
                toLocation: $viewModel.toLocation,
                onSelectFrom: viewModel.selectFrom,
                onSelectTo: viewModel.selectTo
            )
            .padding(.top, 20)
            
            if viewModel.fromLocation != nil, viewModel.toLocation != nil {
                Button(action: viewModel.search) {
                    Text("Найти")
                        .foregroundColor(.ypWhiteUniversal)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 150, height: 60)
                        .background(.ypBlueUniversal)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.top, 16)
            }
            
            Spacer()
            
            Divider()
                .background(.black.opacity(0.3))
                .padding(.bottom, 0.5)
        }
        .background(.ypWhiteDynamic)
        .fullScreenCover(isPresented: $viewModel.showCitySelection) {
            NavigationStack {
                CitySelectionView { city, station in
                    viewModel.handleCitySelection(city: city.title, station: station.title)
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.showCarriers) {
            if let from = viewModel.fromLocation, let to = viewModel.toLocation {
                NavigationStack {
                    CarriersView(fromLocation: from, toLocation: to)
                }
            }
        }
        .fullScreenCover(item: $viewModel.selectedStory) { story in
            StoryDetailView(stories: viewModel.stories, initialIndex: story.id)
        }
    }
}

#Preview {
    ScheduleView()
}
