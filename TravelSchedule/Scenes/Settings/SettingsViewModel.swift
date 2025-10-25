//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import SwiftUI
import Combine

@MainActor
final class SettingsViewModel: ObservableObject {
    @AppStorage(AppStorageKeys.darkModeEnabled.rawValue)
    var darkModeEnabled = false
    
    @Published var showCopyright = false
    
    func openCopyright() {
        showCopyright = true
    }
}
