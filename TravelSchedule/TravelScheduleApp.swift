//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 27.07.2025.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @AppStorage(AppStorageKeys.darkModeEnabled.rawValue) private var darkModeEnabled = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(darkModeEnabled ? .dark : .light)
        }
    }
}
