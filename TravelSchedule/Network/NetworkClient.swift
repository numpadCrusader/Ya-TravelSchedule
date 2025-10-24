//
//  NetworkClient.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 24.10.2025.
//

import Foundation
import OpenAPIURLSession

actor NetworkClient {
    
    // MARK: - Public Properties
    
    static let shared = NetworkClient()
    
    // MARK: - Private Properties
    
    private let apiKey = "256e6928-dd58-4926-b04f-35d5dff8f452"
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Public Methods
    
    func getNearestStations(
        lat: Double,
        lng: Double,
        distance: Int
    ) async throws -> NearestStations {
        let client = try makeClient()
        
        let service = NearestStationsService(
            client: client,
            apikey: apiKey)
        
        return try await service.getNearestStations(
            lat: lat,
            lng: lng,
            distance: distance)
    }
    
    func getScheduleBetweenStations(
        from: String,
        to: String
    ) async throws -> Segments {
        let client = try makeClient()
        
        let service = ScheduleBetweenStationsService(
            client: client,
            apikey: apiKey)
        
        return try await service.getScheduleBetweenStations(from: from, to: to)
    }
    
    func getStationSchedule(station: String) async throws -> ScheduleResponse {
        let client = try makeClient()
        
        let service = StationScheduleService(
            client: client,
            apikey: apiKey)
        
        return try await service.getStationSchedule(station: station)
    }
    
    func getRouteStations(uid: String) async throws -> ThreadStationsResponse {
        let client = try makeClient()
        
        let service = RouteStationsService(
            client: client,
            apikey: apiKey)
        
        return try await service.getRouteStations(uid: uid)
    }
    
    func getNearestCity(
        lat: Double,
        lng: Double
    ) async throws -> NearestCityResponse {
        let client = try makeClient()
        
        let service = NearestCityService(
            client: client,
            apikey: apiKey)
        
        return try await service.getNearestCity(lat: lat, lng: lng)
    }
    
    func getCarrierInfo(code: String) async throws -> CarrierResponse {
        let client = try makeClient()
        
        let service = CarrierInfoService(
            client: client,
            apikey: apiKey)
        
        return try await service.getCarrierInfo(code: code)
    }
    
    func getAllStations() async throws -> AllStationsResponse {
        let client = try makeClient()
        
        let service = AllStationsService(
            client: client,
            apikey: apiKey)
        
        return try await service.getAllStations()
    }
    
    func getCopyright() async throws -> CopyrightResponse {
        let client = try makeClient()
        
        let service = CopyrightService(
            client: client,
            apikey: apiKey)
        
        return try await service.getCopyright()
    }
    
    // MARK: - Private Methods
    
    private func makeClient() throws -> Client {
        let client = Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport())
        
        return client
    }
}
