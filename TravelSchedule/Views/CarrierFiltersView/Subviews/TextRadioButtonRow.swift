//
//  TextRadioButtonRow.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

struct TextRadioButtonRow: View {
    let title: String
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlackDynamic)
            
            Spacer()
            
            Image(isSelected ? .icRadioOn : .icRadioOff)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture(perform: onSelect)
        }
        .frame(height: 60)
        .contentShape(Rectangle())
        .onTapGesture(perform: onSelect)
    }
}
