//
//  CarriersView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct CarriersView: View {
    @Environment(\.dismiss) private var dismiss
    
    let fromLocation: String
    let toLocation: String
    let carriers: [Carrier] = [
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: false
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: true
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: false
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: true
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: true
        ),
        Carrier(
            title: "РЖД",
            date: "14 января",
            fromTime: "22:30",
            toTime: "8:30",
            hasTransfer: false
        )
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("\(fromLocation) → \(toLocation)")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlack)
                .padding(.horizontal, 16)
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(carriers) { carrier in
                        CarrierCardView(carrier: carrier)
                    }
                }
            }
        }
        .padding(.top, 16)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button() {
                    dismiss()
                } label: {
                    Image(.icChevronLeft22Px)
                }
            }
        }
        .overlay(alignment: .bottom) {
            Button() {
                
            } label: {
                Text("Уточнить время")
                    .foregroundColor(.ypWhiteUniversal)
                    .font(.system(size: 17, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.ypBlue)
                    .cornerRadius(16)
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
