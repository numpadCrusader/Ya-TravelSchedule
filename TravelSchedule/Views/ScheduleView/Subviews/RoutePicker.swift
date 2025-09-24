//
//  RoutePicker.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct RoutePicker: View {
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    Button() {
                        
                    } label: {
                        HStack {
                            Text("Откуда")
                                .foregroundColor(.ypGray)
                                .padding(.leading, 16)
                            Spacer()
                        }
                    }
                    .frame(width: 259, height: 48)
                    
                    Button() {
                        
                    } label: {
                        HStack {
                            Text("Куда")
                                .foregroundColor(.ypGray)
                                .padding(.leading, 16)
                            Spacer()
                        }
                    }
                    .frame(width: 259, height: 48)
                }
                .background(.ypWhite)
                .cornerRadius(20)
                
                Button {
                    
                } label: {
                    Image(.сhange)
                    
                }
            }
        }
        .frame(width: 343, height: 128)
        .background(.ypBlue)
        .cornerRadius(20)
    }
}

#Preview {
    RoutePicker()
}
