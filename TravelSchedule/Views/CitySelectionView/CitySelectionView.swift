//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("City Selection")
        }
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button() {
                    dismiss()
                } label: {
                    Image(.chevronBack)
                }
            }
        }
    }
}

#Preview {
    CitySelectionView()
}
