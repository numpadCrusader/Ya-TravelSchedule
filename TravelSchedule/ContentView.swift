//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 27.07.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            testRequests()
        }
    }
}

#Preview {
    ContentView()
}

func testRequests() {
    Task {
        do {
            let networkClient = NetworkClient.shared
            let response = try await networkClient.getAllStations()
            
            print(response.countries?.count)
        } catch {
            print("Network Client Error: \(error)")
        }
    }
}
