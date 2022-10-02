//
//  IGithubSearchAPIRequestBuilder.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

/// <#Description#>
public protocol IGithubSearchAPIRequestBuilder {
    
    var endpointsBuilder: IGithubSearchAPIEndpointsBuilder { get set }
    
    func getSearchRepositories(with requestData: SearchRepositoryRequestData,
                               encoder: JSONEncoder) throws -> URLRequest
}
