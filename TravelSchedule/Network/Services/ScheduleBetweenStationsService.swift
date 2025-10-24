//
//  ScheduleBetweenStationsService.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 12.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Segments = Components.Schemas.Segments

protocol ScheduleBetweenStationsServiceProtocol {
    func getScheduleBetweenStations(
        from: String,
        to: String
    ) async throws -> Segments
}

final class ScheduleBetweenStationsService: ScheduleBetweenStationsServiceProtocol {
    
    // MARK: - Private Properties
    
    private let client: Client
    private let apikey: String
    
    // MARK: - Initializers
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    // MARK: - Public Methods
    
    func getScheduleBetweenStations(
        from: String,
        to: String
    ) async throws -> Segments {
        let response = try await client.getSchedualBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to
        ))
        
        return try response.ok.body.json
    }
}
