//
//  TextChevronRowv.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 17.10.2025.
//

import SwiftUI

struct TextChevronRow: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlackDynamic)
            
            Spacer()
            
            Image(.icChevronRight24Px)
        }
        .frame(height: 60)
    }
}

#Preview {
    TextChevronRow(text: "Test")
}
