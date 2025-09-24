//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.09.2025.
//

import SwiftUI

struct ScheduleView: View {
    @State private var fromLocation: String?
    @State private var toLocation: String?
    
    var body: some View {
        VStack(spacing: 16) {
            RoutePicker(
                fromLocation: $fromLocation,
                toLocation: $toLocation)
        }
    }
}

#Preview {
    ScheduleView()
}
