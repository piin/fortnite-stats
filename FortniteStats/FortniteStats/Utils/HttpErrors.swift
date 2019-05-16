//
//  HttpErrors.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 26/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//


enum HttpErrors: Error {

    case jsonError
    case serverError
    case apiError(String)
    
    func getErrorMessage() -> String {
        
        switch self {
        case .jsonError:
            return "Error with the JSON"
        case .serverError:
            return "Error with the server"
        case .apiError(let error):
            return error
        }
        
    }
}


