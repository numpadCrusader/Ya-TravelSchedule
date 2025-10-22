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
    
    var onSelectFrom: () -> Void
    var onSelectTo: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 0) {
                RoutePickerButton(
                    title: fromLocation ?? "Откуда",
                    isPlaceholder: fromLocation == nil,
                    action: onSelectFrom)
                
                RoutePickerButton(
                    title: toLocation ?? "Куда",
                    isPlaceholder: toLocation == nil,
                    action: onSelectTo)
            }
            .background(.ypWhiteUniversal)
            .cornerRadius(20)
            
            Button {
                swap(&fromLocation, &toLocation)
            } label: {
                Image(.сhange)
            }
        }
        .frame(width: 343, height: 128)
        .background(.ypBlueUniversal)
        .cornerRadius(20)
    }
}

private struct RoutePickerButton: View {
    let title: String
    let isPlaceholder: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(isPlaceholder ? .ypGrayUniversal : .ypBlackUniversal)
                    .padding(.leading, 16)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer()
            }
            .frame(width: 259, height: 48)
        }
    }
}
