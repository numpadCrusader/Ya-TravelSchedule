//
//  ErrorType.swift
//  TravelSchedule
//
//  Created by Nikita Khon on 19.10.2025.
//

import SwiftUI

enum ErrorType {
    case serverError, noInternet
    
    var imageResource: ImageResource {
        switch self {
            case .serverError: .imServerError
            case .noInternet: .imNoInternet
        }
    }
    
    var description: String {
        switch self {
            case .serverError: "Ошибка сервера"
            case .noInternet: "Нет интернета"
        }
    }
}
