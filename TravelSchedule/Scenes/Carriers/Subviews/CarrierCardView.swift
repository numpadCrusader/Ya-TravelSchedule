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
                AsyncImage(url: URL(string: carrier.logoUrl)) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 38, height: 38)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 38, height: 38)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                        @unknown default:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 38, height: 38)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(carrier.title)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.ypBlackUniversal)
                    
                    if carrier.hasTransfer {
                        Text("С пересадкой")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.ypRedUniversal)
                    }
                }
            }
            
            HStack(alignment: .center) {
                Text(carrier.departureTime)
                
                ZStack {
                    Rectangle()
                        .fill(.ypGrayUniversal)
                        .frame(height: 1)
                    
                    Text(hoursWord(for: carrier.routeDuration))
                        .font(.system(size: 12, weight: .regular))
                        .padding(.horizontal, 5)
                        .background(.ypLightGrayUniversal)
                }
                
                Text(carrier.arrivalTime)
            }
            .font(.system(size: 17, weight: .regular))
            .foregroundStyle(.ypBlackUniversal)
        }
        .padding(14)
        .background(.ypLightGrayUniversal)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal, 16)
        .overlay(alignment: .topTrailing) {
            Text(carrier.departureDay)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlackUniversal)
                .padding(.top, 15)
                .padding(.trailing, 23)
        }
    }
    
    private func hoursWord(for number: Int) -> String {
        let n = abs(number) % 100
        let lastDigit = n % 10
        
        let hoursWord = if n >= 11 && n <= 19 {
            "часов"
        } else if lastDigit == 1 {
            "час"
        } else if (2...4).contains(lastDigit) {
            "часа"
        } else {
            "часов"
        }
        
        return "\(number/3600) \(hoursWord)"
    }
}
