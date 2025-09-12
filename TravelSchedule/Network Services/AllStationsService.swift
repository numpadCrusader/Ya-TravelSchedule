//
//  AllStationsService.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 12.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias AllStationsResponse = Components.Schemas.AllStationsResponse

protocol AllStationsServiceProtocol {
    func getAllStations() async throws -> AllStationsResponse
}

final class AllStationsService: AllStationsServiceProtocol {
    
    // MARK: - Private Properties
    
    private let client: Client
    private let apikey: String
    
    // MARK: - Initializers
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    // MARK: - Public Methods
    
    func getAllStations() async throws -> AllStationsResponse {
//        let response = try await client.getAllStations(query: .init(
//            apikey: apikey
//        ))
//        
//        return try response.ok.body.json
        return AllStationsResponse()
    }
}
