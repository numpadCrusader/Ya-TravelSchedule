//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ErrorView(errorType: .noInternet)
//            ErrorView(errorType: .serverError)
            
            Spacer()
            
            Divider()
                .background(.black.opacity(0.3))
                .padding(.bottom, 0.5)
        }
        .background(.ypWhiteDynamic)
    }
}

#Preview {
    SettingsView()
}
