//
//  NearestCityService.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 12.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestCityResponse = Components.Schemas.NearestCityResponse

protocol NearestCityServiceProtocol {
    func getNearestCity(
        lat: Double,
        lng: Double
    ) async throws -> NearestCityResponse
}

final class NearestCityService: NearestCityServiceProtocol {
    
    // MARK: - Private Properties
    
    private let client: Client
    private let apikey: String
    
    // MARK: - Initializers
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    // MARK: - Public Methods
    
    func getNearestCity(
        lat: Double,
        lng: Double
    ) async throws -> NearestCityResponse {
        let response = try await client.getNearestCity(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        
        return try response.ok.body.json
    }
}
