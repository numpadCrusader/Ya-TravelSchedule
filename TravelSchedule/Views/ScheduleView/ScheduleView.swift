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
    
    var body: some View {
        VStack(spacing: 16) {
            RoutePicker(
                fromLocation: $fromLocation,
                toLocation: $toLocation,
                onSelectFrom: {
                    selectedPickerType = .from
                },
                onSelectTo: {
                    selectedPickerType = .to
                }
            )
            .padding(.top, 208)
            
            if let _ = fromLocation, let _ = toLocation {
                Button() {
                    print("Finding route")
                } label: {
                    Text("Найти")
                        .foregroundColor(.ypWhite)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 150, height: 60)
                        .background(.ypBlue)
                        .cornerRadius(16)
                }
            }
            
            Spacer()
        }
        .navigationDestination(item: $selectedPickerType) { _ in
            CitySelectionView()
        }
    }
}

enum PickerType: Hashable {
    case from, to
}

#Preview {
    ScheduleView()
}
