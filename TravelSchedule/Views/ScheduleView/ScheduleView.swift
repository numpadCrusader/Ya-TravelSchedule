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
    
    var body: some View {
        VStack(spacing: 16) {
            RoutePicker(
                fromLocation: $fromLocation,
                toLocation: $toLocation,
                onSelectFrom: {
                    selectedPickerType = .from
                    showCitySelection = true
                },
                onSelectTo: {
                    selectedPickerType = .to
                    showCitySelection = true
                }
            )
            .padding(.top, 208)
            
            if fromLocation != nil, toLocation != nil {
                Button() {
                    showCarriers = true
                } label: {
                    Text("Найти")
                        .foregroundColor(.ypWhiteUniversal)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 150, height: 60)
                        .background(.ypBlueUniversal)
                        .cornerRadius(16)
                }
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
                    if selectedPickerType == .from {
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
    }
}

enum PickerType: Hashable {
    case from, to
}

#Preview {
    ScheduleView()
}
