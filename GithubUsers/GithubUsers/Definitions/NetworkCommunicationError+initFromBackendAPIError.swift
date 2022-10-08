//
//  NetworkCommunicationError+initFromBackendAPIError.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 08.10.2022.
//

import Foundation
import BackendAPI

extension NetworkCommunicationError {
    
    init?(from apiError: BackendAPIError) {
        
        switch apiError {
        
        case .requestExecutionError(.networkUnavailable):
            
            self = .networkUnavailable
        
        case .requestExecutionError(.httpStatusError(.requestTimeout)),
             .requestExecutionError(.timeout):
            
            self = .serverUnavailable
        
        case .requestExecutionError(.connectionInterrupted):
            
            self = .connectionLost
            
        default:
            
            return nil
        }
    }
    
}
