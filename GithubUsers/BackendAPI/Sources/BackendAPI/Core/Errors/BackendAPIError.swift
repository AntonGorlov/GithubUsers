//
//  BackendAPIError.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation
import SwiftUI

public enum BackendAPIError: Error {
    
    case requestBuildingError(RequestBuildingError)
    
    case requestExecutionError(RequestExecutionError)
    
    case unexpected(Error)
}
