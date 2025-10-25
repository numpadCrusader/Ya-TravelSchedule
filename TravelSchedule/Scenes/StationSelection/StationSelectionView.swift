//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: StationSelectionViewModel
    
    let onSelect: (Station) -> Void
    
    init(stations: [Station], onSelect: @escaping (Station) -> Void) {
        _viewModel = StateObject(wrappedValue: StationSelectionViewModel(stations: stations))
        self.onSelect = onSelect
    }
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchQuery, prompt: "Введите запрос")
            
            if viewModel.searchResults.isEmpty {
                VStack {
                    Spacer()
                    Text("Станция не найдена")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.ypBlackDynamic)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                List {
                    ForEach(viewModel.searchResults) { station in
                        Button {
                            onSelect(station)
                        } label: {
                            TextChevronRow(text: station.title)
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
        .navigationTitle("Выбор станции")
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
    StationSelectionView(stations: []) { _ in }
}
