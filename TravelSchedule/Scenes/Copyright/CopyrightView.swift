//
//  CopyrightView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 20.10.2025.
//

import SwiftUI

struct CopyrightView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text(MockData.practicumText)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackDynamic)
                
                Text(MockData.descriptionText)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.ypBlackDynamic)
                
                Text("1. ТЕРМИНЫ")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackDynamic)
                    .padding(.top, 24)
                
                Text(MockData.terminologyText)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.ypBlackDynamic)
            }
            .padding(.horizontal, 16)
        }
        .padding(.top, 16)
        .background(.ypWhiteDynamic)
        .navigationTitle("Пользовательское соглашение")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.icChevronLeft)
                }
            }
        }
    }
}

#Preview {
    CopyrightView()
}
