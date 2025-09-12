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
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport())
            
            let apiKey = "256e6928-dd58-4926-b04f-35d5dff8f452"
            
            await testNearestStations(client: client, apiKey: apiKey)
//            await testScheduleBetweenStations(client: client, apiKey: apiKey)
//            await testStationScheduleService(client: client, apiKey: apiKey)
//            await testRouteStationsService(client: client, apiKey: apiKey)
//            await testNearestCityService(client: client, apiKey: apiKey)
//            await testCarrierInfoService(client: client, apiKey: apiKey)
//            await testAllStationsService(client: client, apiKey: apiKey)
//            await testCopyrightService(client: client, apiKey: apiKey)
        } catch {
            print("Network Client Error: \(error)")
        }
    }
}

func testNearestStations(client: Client, apiKey: String) async {
    do {
        let service = NearestStationsService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getNearestStations(
            lat: 59.864177,
            lng: 30.319163,
            distance: 50)
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}

func testScheduleBetweenStations(client: Client, apiKey: String) async {
    do {
        let service = ScheduleBetweenStationsService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getScheduleBetweenStations(from: "c146", to: "c213")
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}

func testStationScheduleService(client: Client, apiKey: String) async {
    do {
        let service = StationScheduleService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getStationSchedule(station: "s9600213")
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}

func testRouteStationsService(client: Client, apiKey: String) async {
    do {
        let service = RouteStationsService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getRouteStations(uid: "SU-1964_260116_c26_12")
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}

func testNearestCityService(client: Client, apiKey: String) async {
    do {
        let service = NearestCityService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getNearestCity(lat: 59.864177, lng: 30.319163)
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}

func testCarrierInfoService(client: Client, apiKey: String) async {
    do {
        let service = CarrierInfoService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getCarrierInfo(code: "1111")
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}

func testAllStationsService(client: Client, apiKey: String) async {
    do {
        let service = AllStationsService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getAllStations()
        
        print("Response: \(response.countries?.count)")
    } catch {
        print("Request error: \(error)")
    }
}

func testCopyrightService(client: Client, apiKey: String) async {
    do {
        let service = CopyrightService(
            client: client,
            apikey: apiKey)
        
        let response = try await service.getCopyright()
        
        print("Response: \(response)")
    } catch {
        print("Request error: \(error)")
    }
}
