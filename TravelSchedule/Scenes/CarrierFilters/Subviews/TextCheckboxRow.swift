//
//  TextCheckboxRow.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

struct TextCheckboxRow: View {
    let title: String
    let isChecked: Bool
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlackDynamic)
            
            Spacer()
            
            Image(isChecked ? .icCheckboxOn : .icCheckboxOff)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture(perform: onToggle)
        }
        .frame(height: 60)
        .contentShape(Rectangle())
        .onTapGesture(perform: onToggle)
    }
}
