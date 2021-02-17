//
//  APIError.swift
//  ApiNews_v1.0
//
//  Created by emm on 15/02/2021.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}


extension APIError: LocalizedError {
    
    var errorDescription: String? {
        
        switch self {
            case.decodingError:
                return "failed to decode the object from the service"
            case .errorCode(let code):
                return "\(code) - something went wrong"
            case .unknown:
                return "The error is unknown"
        }
    }
}
