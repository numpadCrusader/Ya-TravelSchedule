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
    
    init(fromLocation: Location, toLocation: Location) {
        _viewModel = StateObject(
            wrappedValue: CarriersViewModel(fromLocation: fromLocation, toLocation: toLocation)
        )
    }
    
    var body: some View {
        VStack {
            Text("\(viewModel.fromLocation.description) → \(viewModel.toLocation.description)")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlackDynamic)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.leading)
            
            if let errorType = viewModel.errorType {
                Spacer()
                ErrorView(errorType: errorType)
                Spacer()
            } else if viewModel.carriers.isEmpty {
                Spacer()
                Text("Вариантов нет")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlackDynamic)
                    .multilineTextAlignment(.center)
                Spacer()
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
            CarrierFiltersView(
                initialSelectedTimes: viewModel.selectedTimeRanges,
                initialShowTransfers: viewModel.showTransfers
            ) { timeRangeList, showTransfers in
                viewModel.selectedTimeRanges = timeRangeList
                viewModel.showTransfers = showTransfers
                viewModel.applyFilters()
            }
        }
        .navigationDestination(item: $viewModel.selectedCarrier) { carrier in
            CarrierInfoView(carrierCode: carrier.code)
        }
        .overlay(alignment: .bottom) {
            if viewModel.errorType == nil {
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
        .task {
            if viewModel.carriers.isEmpty {
                viewModel.loadCarriers()
            }
        }
    }
}
