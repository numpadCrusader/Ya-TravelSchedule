//
//  CarrierInfoViewModel.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 23.10.2025.
//

import Foundation
import Combine

@MainActor
final class CarrierInfoViewModel: ObservableObject {
    @Published var carrierName: String?
    @Published var carrierLogoUrl: String?
    @Published var contacts: [Contact] = []
    @Published var errorType: ErrorType?
    
    func loadCarrierInfo(by code: Int) {
        Task {
            do {
                let response = try await NetworkClient.shared.getCarrierInfo(code: "\(code)")
                
                carrierName = response.carrier?.title
                carrierLogoUrl = response.carrier?.logo
                parseContacts(from: response.carrier?.contacts)
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
    
    private func parseContacts(from htmlString: String?) {
        guard let htmlString, !htmlString.isEmpty else { return }
        
        let entries = htmlString.components(separatedBy: "<br>\r\n")
        
        contacts = entries.compactMap {
            let parts = $0.components(separatedBy: ": ")
            guard parts.count == 2 else { return nil }
            
            let title = parts[0].capitalized
            let detail = parts[1]
            
            return Contact(title: title, description: detail)
        }
    }
}
