//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            VStack {
                TextToggleRow(
                    text: "Темная тема",
                    isEnabled: $viewModel.darkModeEnabled
                )
                
                Button {
                    viewModel.openCopyright()
                } label: {
                    TextChevronRow(text: "Пользовательское соглашение")
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия 1.0 (beta)")
            }
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.ypBlackDynamic)
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            
            Divider()
                .background(.black.opacity(0.3))
                .padding(.bottom, 0.5)
        }
        .padding(.top, 24)
        .background(.ypWhiteDynamic)
        .fullScreenCover(isPresented: $viewModel.showCopyright) {
            NavigationStack {
                CopyrightView()
            }
        }
    }
}

#Preview {
    SettingsView()
}
