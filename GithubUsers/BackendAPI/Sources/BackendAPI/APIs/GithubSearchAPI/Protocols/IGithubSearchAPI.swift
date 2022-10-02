//
//  IGithubSearchAPI.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

/// <#Description#>
public protocol IGithubSearchAPI {
    
    var requestBuilder: IGithubSearchAPIRequestBuilder { get set }
    
    typealias SearchRepositoryResult = (Result<SearchRepositoriesResponseData, BackendAPIError>) -> Void
    
    /// Get search repository
    /// - Parameters:
    ///   - request: SearchRepositoryRequestData
    ///   - completion: SearchRepositoryResult
    func getSearchRepositories(with requestData: SearchRepositoryRequestData,
                               completion: @escaping SearchRepositoryResult)
}

