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
    
    @Published var selectedTimeRanges: Set<TimeRange> = []
    @Published var showTransfers: Bool?
    
    let fromLocation: Location
    let toLocation: Location
    
    private lazy var isoFormatter = ISO8601DateFormatter()
    
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
    
    func applyFilters() {

    }
    
    func loadCarriers() {
        Task {
            do {
                let response = try await NetworkClient.shared.getScheduleBetweenStations(
                    from: fromLocation.station.code,
                    to: toLocation.station.code
                )
                
                let segments = response.segments ?? []
                carriers = segments.compactMap {
                    guard
                        let title = $0.thread?.carrier?.title,
                        let code = $0.thread?.carrier?.code,
                        let logoUrl = $0.thread?.carrier?.logo,
                        let departureString = $0.departure,
                        let arrivalString = $0.arrival,
                        let departureDate = isoFormatter.date(from: departureString),
                        let arrivalDate = isoFormatter.date(from: arrivalString),
                        let duration = $0.duration
                    else {
                        return nil
                    }
                    
                    return Carrier(
                        title: title,
                        code: code,
                        logoUrl: logoUrl,
                        departureDay: dayMonthFormatter.string(from: departureDate),
                        departureTime: timeFormatter.string(from: departureDate),
                        arrivalTime: timeFormatter.string(from: arrivalDate),
                        routeDuration: duration,
                        hasTransfer: false
                    )
                }
            } catch {
                handle(error)
            }
        }
    }
    
    private func handle(_ error: Error) {
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
    }
}
