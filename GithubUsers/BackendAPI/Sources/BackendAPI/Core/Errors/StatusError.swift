//
//  StatusError.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

/// Warning! Status code may be different. It's for example. Consult with your backend team
public enum StatusError: Int, Error {
    
    case notModified         = 304
    case badRequest          = 400
    case unauthorized        = 401
    case forbidden           = 403
    case notFound            = 404
    case methodNotAllowed    = 405
    case notAcceptable       = 406
    case requestTimeout      = 408
    case validationFailed    = 422
    case internalServerError = 500
    case serviceUnavailable  = 503
    case notDefined
    
    internal init(_ rawValue: Int) {
        
        self = Self(rawValue: rawValue) ?? .notDefined
    }
}
