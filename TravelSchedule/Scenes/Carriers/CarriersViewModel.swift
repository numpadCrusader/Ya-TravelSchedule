//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class CarriersViewModel: ObservableObject {
    @Published var showCarrierFilters = false
    @Published var selectedCarrier: Carrier?
    @Published var carriers: [Carrier] = []
    @Published var errorType: ErrorType?
    
    let fromLocation: Location
    let toLocation: Location
    
    private lazy var isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    private lazy var dayMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    init(
        fromLocation: Location,
        toLocation: Location,
    ) {
        self.fromLocation = fromLocation
        self.toLocation = toLocation
    }
    
    func selectCarrier(_ carrier: Carrier) {
        selectedCarrier = carrier
    }
    
    func openFilters() {
        showCarrierFilters = true
    }
    
    func loadCarriers() {
        Task {
            do {
                let networkClient = NetworkClient.shared
                
                let response = try await networkClient.getScheduleBetweenStations(
                    from: fromLocation.station.code,
                    to: toLocation.station.code
                )
                
                let segments = response.segments ?? []
                let carrier = segments.map {
                    let departureDate = isoFormatter.date(from: $0.departure ?? "")
                    let arrivalDate = isoFormatter.date(from: $0.arrival ?? "")
                    
                    return Carrier(
                        title: $0.thread?.carrier?.title ?? "",
                        date: dayMonthFormatter.string(from: departureDate ?? Date()),
                        fromTime: timeFormatter.string(from: departureDate ?? Date()),
                        toTime: timeFormatter.string(from: arrivalDate ?? Date())
                    )
                }
                
                self.carriers = carrier
            } catch {
                if let urlError = error as? URLError {
                    switch urlError.code {
                        case .notConnectedToInternet, .networkConnectionLost:
                            errorType = .noInternet
                        default:
                            errorType = .serverError
                    }
                } else {
                    errorType = .serverError
                }
                
                print("CarriersViewModel Error. \(error)")
            }
        }
    }
}
