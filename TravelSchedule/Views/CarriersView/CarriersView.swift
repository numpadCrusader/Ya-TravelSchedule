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
            hasTransfer: true
        )
    ]
    
    var body: some View {
        Text("\(fromLocation) → \(toLocation)")
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.ypBlack)
            .padding(.top, 16)
            .padding(.horizontal, 16)
        
        ScrollView {
            LazyVStack {
                ForEach(carriers) { carrier in
                    CarrierCardView(carrier: carrier)
                }
            }
        }
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
    CarriersView(
        fromLocation: "Москва (Ярославский вокзал)",
        toLocation: "Санкт Петербург (Балтийский вокзал)"
    )
}
