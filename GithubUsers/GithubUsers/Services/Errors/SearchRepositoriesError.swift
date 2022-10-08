//
//  SearchRepositoriesError.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 05.10.2022.
//

import Foundation

/// List of repositories error
enum SearchRepositoriesError: Error {
    
    case networkCommunicationError(NetworkCommunicationError)
    
    case unexpected
    
    case emptySearchRepositoriesResult
}
