//
//  ErrorType.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import Foundation

enum ErrorType {
    case serverError, noInternet
    
    var imageName: String {
        switch self {
            case .serverError: "im_server_error"
            case .noInternet: "im_no_internet"
        }
    }
    
    var description: String {
        switch self {
            case .serverError: "Ошибка сервера"
            case .noInternet: "Нет интернета"
        }
    }
}
