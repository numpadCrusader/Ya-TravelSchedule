//
//  CarrierCardView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 18.10.2025.
//

import SwiftUI

struct CarrierCardView: View {
    let carrier: Carrier
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 8) {
                Image(.icBrand1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(carrier.title)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.ypBlackUniversal)
                }
            }
            
            HStack(alignment: .center) {
                Text(carrier.fromTime)
                
                ZStack {
                    Rectangle()
                        .fill(.ypGrayUniversal)
                        .frame(height: 1)
                    
                    Text("20 часов")
                        .font(.system(size: 12, weight: .regular))
                        .padding(.horizontal, 5)
                        .background(.ypLightGrayUniversal)
                }
                
                Text(carrier.toTime)
            }
            .font(.system(size: 17, weight: .regular))
            .foregroundStyle(.ypBlackUniversal)
        }
        .padding(14)
        .background(.ypLightGrayUniversal)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal, 16)
        .overlay(alignment: .topTrailing) {
            Text(carrier.date)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlackUniversal)
                .padding(.top, 15)
                .padding(.trailing, 23)
        }
    }
}

#Preview {
    CarrierCardView(carrier: Carrier(
        title: "РЖД",
        date: "14 января",
        fromTime: "22:30",
        toTime: "8:30"
    ))
}
