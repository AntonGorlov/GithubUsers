//
//  NetworkCommunicationError.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 05.10.2022.
//

import Foundation

/// Network errors
enum NetworkCommunicationError: Error {
    
    case networkUnavailable
    
    case serverUnavailable
    
    case connectionLost
}
