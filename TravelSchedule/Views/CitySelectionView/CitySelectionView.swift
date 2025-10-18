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
    
    let cities = [
        "Москва", "Санкт Петербург", "Сочи", "Горный воздух",
        "Краснодар", "Казань", "Омск"
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchQuery, prompt: "Введите запрос")
            
            if searchResults.isEmpty {
                VStack {
                    Spacer()
                    Text("Город не найден")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.ypBlack)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                List {
                    ForEach(searchResults, id: \.self) { city in
                        TextChevronRow(text: city)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                }
                .listStyle(.plain)
                .padding(.top, 16)
            }
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
    
    var searchResults: [String] {
        if searchQuery.isEmpty {
            cities
        } else {
            cities.filter { $0.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}

#Preview {
    CitySelectionView()
}
