//
//  RequestBuildingError.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

public enum RequestBuildingError: Error {
    
    case serializationError(EncodingError)
    
    case urlRequestInitializationError(Error)
    
    case unexpected(Error)
}
