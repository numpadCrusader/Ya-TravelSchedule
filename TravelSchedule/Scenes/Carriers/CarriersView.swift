//
//  CarriersView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct CarriersView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CarriersViewModel
    
    init(fromLocation: String, toLocation: String) {
        _viewModel = StateObject(
            wrappedValue: CarriersViewModel(fromLocation: fromLocation, toLocation: toLocation)
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.fromLocation) → \(viewModel.toLocation)")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlackDynamic)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.leading)
            
            if viewModel.carriers.isEmpty {
                VStack {
                    Spacer()
                    Text("Вариантов нет")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.ypBlackDynamic)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.carriers) { carrier in
                            Button {
                                viewModel.selectCarrier(carrier)
                            } label: {
                                CarrierCardView(carrier: carrier)
                            }
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 84)
                }
                .padding(.top, 16)
            }
        }
        .padding(.top, 16)
        .background(.ypWhiteDynamic)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.icChevronLeft)
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.showCarrierFilters) {
            CarrierFiltersView { timeRangeList, showTransfers in }
        }
        .navigationDestination(item: $viewModel.selectedCarrier) { _ in
            CarrierInfoView()
        }
        .overlay(alignment: .bottom) {
            Button {
                viewModel.openFilters()
            } label: {
                Text("Уточнить время")
                    .foregroundColor(.ypWhiteUniversal)
                    .font(.system(size: 17, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.ypBlueUniversal)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    CarriersView(
        fromLocation: "Москва (Ярославский вокзал)",
        toLocation: "Санкт Петербург (Балтийский вокзал)"
    )
}
