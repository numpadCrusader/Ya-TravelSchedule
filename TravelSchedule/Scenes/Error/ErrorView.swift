//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

struct ErrorView: View {
    let errorType: ErrorType
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(errorType.imageResource)
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
                .clipShape(RoundedRectangle(cornerRadius: 70))
            
            Text(errorType.description)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlackDynamic)
        }
    }
}

#Preview {
    ErrorView(errorType: .noInternet)
}
