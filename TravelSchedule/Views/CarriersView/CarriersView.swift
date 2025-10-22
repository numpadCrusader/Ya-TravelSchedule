//
//  CarriersView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct CarriersView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var showCarrierFilters = false
    @State private var selectedCarrier: Carrier?
    
    let fromLocation: String
    let toLocation: String
    let carriers: [Carrier] = MockData.carriers
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(fromLocation) → \(toLocation)")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlackDynamic)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.leading)
            
            if carriers.isEmpty {
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
                        ForEach(carriers) { carrier in
                            Button {
                                selectedCarrier = carrier
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
                Button() {
                    dismiss()
                } label: {
                    Image(.icChevronLeft)
                }
            }
        }
        .navigationDestination(isPresented: $showCarrierFilters) {
            CarrierFiltersView { timeRangeList, showTransfers in
                
            }
        }
        .navigationDestination(item: $selectedCarrier) { _ in
            CarrierInfoView()
        }
        .overlay(alignment: .bottom) {
            Button() {
                showCarrierFilters = true
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
