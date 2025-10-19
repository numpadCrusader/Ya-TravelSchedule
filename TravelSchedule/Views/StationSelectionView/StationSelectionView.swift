//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchQuery = ""
    
    let onSelect: (String) -> Void
    
    let stations = [
        "Киевский вокзал", "Курский вокзал", "Ярославский вокзал",
        "Белорусский вокзал", "Савеловский вокзал", "Ленинградский вокзал"
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchQuery, prompt: "Введите запрос")
            
            if searchResults.isEmpty {
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
                    ForEach(searchResults, id: \.self) { station in
                        Button {
                            onSelect(station)
                        } label: {
                            TextChevronRow(text: station)
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                }
                .listStyle(.plain)
                .padding(.top, 16)
            }
        }
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.icChevronLeft22Px)
                }
            }
        }
    }
    
    var searchResults: [String] {
        if searchQuery.isEmpty {
            stations
        } else {
            stations.filter { $0.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}

#Preview {
    StationSelectionView { _ in }
}
