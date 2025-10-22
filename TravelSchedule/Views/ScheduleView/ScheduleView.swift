//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct ScheduleView: View {
    @State private var fromLocation: String?
    @State private var toLocation: String?
    @State private var selectedPickerType: PickerType?
    
    @State private var showCitySelection = false
    @State private var showCarriers = false
    
    @State private var selectedStory: Story?
    let stories = MockData.stories
    
    var body: some View {
        VStack {
            StoryCarouselView(stories: stories) { story in
                selectedStory = story
            }
            
            RoutePicker(
                fromLocation: $fromLocation,
                toLocation: $toLocation,
                onSelectFrom: {
                    selectedPickerType = .fromLocation
                    showCitySelection = true
                },
                onSelectTo: {
                    selectedPickerType = .toLocation
                    showCitySelection = true
                }
            )
            .padding(.top, 20)
            
            if fromLocation != nil, toLocation != nil {
                Button() {
                    showCarriers = true
                } label: {
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
        .fullScreenCover(isPresented: $showCitySelection) {
            NavigationStack {
                CitySelectionView { city, station in
                    if selectedPickerType == .fromLocation {
                        fromLocation = "\(city) (\(station))"
                    } else {
                        toLocation = "\(city) (\(station))"
                    }
                    showCitySelection = false
                }
            }
        }
        .fullScreenCover(isPresented: $showCarriers) {
            if let from = fromLocation, let to = toLocation {
                NavigationStack {
                    CarriersView(fromLocation: from, toLocation: to)
                }
            }
        }
        .fullScreenCover(item: $selectedStory) { story in
            StoryDetailView(stories: stories, initialIndex: story.id)
        }
    }
}

#Preview {
    ScheduleView()
}
