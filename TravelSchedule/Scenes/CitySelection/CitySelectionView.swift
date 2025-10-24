//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CitySelectionViewModel()
    
    let onComplete: (City, Station) -> Void
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchQuery, prompt: "Введите запрос")
            
            if viewModel.searchResults.isEmpty {
                VStack {
                    Spacer()
                    Text("Город не найден")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.ypBlackDynamic)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                List {
                    ForEach(viewModel.searchResults) { city in
                        Button {
                            viewModel.select(city: city)
                        } label: {
                            TextChevronRow(text: city.title)
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(Color.ypWhiteDynamic)
                    }
                }
                .listStyle(.plain)
                .padding(.top, 16)
            }
        }
        .background(.ypWhiteDynamic)
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.icChevronLeft)
                }
            }
        }
        .navigationDestination(item: $viewModel.selectedCity) { city in
            StationSelectionView(stations: city.stations) { station in
                onComplete(city, station)
            }
        }
    }
}

#Preview {
    CitySelectionView { _, _ in }
}
