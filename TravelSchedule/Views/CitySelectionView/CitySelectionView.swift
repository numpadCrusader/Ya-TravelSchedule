//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchQuery = ""
    
    let fruits = [
        "Apple", "Banana", "Orange", "Mango",
        "Apple", "Banana", "Orange", "Mango",
        "Apple", "Banana", "Orange", "Mango",
        "Apple", "Banana", "Orange", "Mango",
        "Apple", "Banana", "Orange", "Mango"
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchQuery, prompt: "Введите запрос")
            
            List(fruits, id: \.self) { fruit in
                TextChevronRow(text: fruit)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .listStyle(.plain)
            .padding(.top, 16)
        }
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button() {
                    dismiss()
                } label: {
                    Image(.icChevronLeft22Px)
                }
            }
        }
    }
}

#Preview {
    CitySelectionView()
}
