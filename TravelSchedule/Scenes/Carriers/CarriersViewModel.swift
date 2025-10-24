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
    
    func loadCarriers() {
        Task {
            do {
                let response = try await NetworkClient.shared.getScheduleBetweenStations(
                    from: fromLocation.station.code,
                    to: toLocation.station.code
                )
                
                carriers = (response.segments ?? []).compactMap { segment in
                    guard
                        let depStr = segment.departure,
                        let arrStr = segment.arrival,
                        let departure = isoFormatter.date(from: depStr),
                        let arrival = isoFormatter.date(from: arrStr),
                        let duration = segment.duration
                    else {
                        return nil
                    }
                    
                    return Carrier(
                        title: segment.thread?.carrier?.title ?? "",
                        date: dayMonthFormatter.string(from: departure),
                        fromTime: timeFormatter.string(from: departure),
                        toTime: timeFormatter.string(from: arrival),
                        duration: hoursCeiled(from: duration)
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
    
    func hoursCeiled(from seconds: Int) -> Int {
        Int(floor(Double(seconds) / 3600.0))
    }
}
