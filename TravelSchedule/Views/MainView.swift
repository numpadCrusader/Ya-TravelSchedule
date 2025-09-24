//
//  MainView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Image(.schedule)
                }
            
            SettingsView()
                .tabItem {
                    Image(.settings)
                }
        }
        .tint(.ypBlack)
    }
}

#Preview {
    MainView()
}
