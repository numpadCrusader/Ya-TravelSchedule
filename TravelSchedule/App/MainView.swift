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
            NavigationStack {
                ScheduleView()
            }
            .tabItem {
                Image(.schedule)
            }
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Image(.settings)
            }
        }
        .tint(.ypBlackDynamic)
    }
}

#Preview {
    MainView()
}
