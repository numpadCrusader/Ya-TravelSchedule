//
//  TextToggleRow.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct TextToggleRow: View {
    let text: String
    @Binding var isEnabled: Bool
    
    var body: some View {
        VStack {
            Toggle(isOn: $isEnabled) {
                Text(text)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.ypBlackDynamic)
            }
            .tint(.ypBlueUniversal)
        }
        .frame(height: 60)
    }
}
