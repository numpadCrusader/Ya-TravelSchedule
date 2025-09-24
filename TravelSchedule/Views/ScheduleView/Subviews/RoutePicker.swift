//
//  RoutePicker.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct RoutePicker: View {
    @Binding var fromLocation: String?
    @Binding var toLocation: String?
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                RoutePickerButton(
                    title: "Откуда",
                    isPlaceholder: fromLocation == nil)
                
                RoutePickerButton(
                    title: "Куда",
                    isPlaceholder: toLocation == nil)
            }
            .background(.ypWhite)
            .cornerRadius(20)
            
            Button {
                swap(&fromLocation, &toLocation)
            } label: {
                Image(.сhange)
            }
        }
        .frame(width: 343, height: 128)
        .background(.ypBlue)
        .cornerRadius(20)
    }
}

struct RoutePickerButton: View {
    let title: String
    let isPlaceholder: Bool
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Text(title)
                    .foregroundColor(isPlaceholder ? .ypGray : .primary)
                    .padding(.leading, 16)
                
                Spacer()
            }
            .frame(width: 259, height: 48)
        }
    }
}
