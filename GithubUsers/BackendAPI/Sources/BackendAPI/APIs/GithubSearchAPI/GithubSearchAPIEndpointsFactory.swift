//
//  GithubSearchAPIEndpointsFactory.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

class GithubSearchAPIEndpointsFactory: IGithubSearchAPIEndpointsBuilder {
    
    private(set) var configuration: Configuration
    
    init() {
        
        guard let configuration = BackendAPIConfigurator.shared.configuration else {
            
            fatalError(MISS_CONFIG_FATAL_ERROR)
        }
        
        self.configuration = configuration
    }
    
    // MARK: - Endpoints
    
    var getSearchRepositoriesWithSortAndStars: URL {
        
//    https://api.github.com/search/repositories?q=language=+sort:stars
        
        return configuration
            .baseURL
            .appendingPathComponent("search")
            .appendingPathComponent("repositories")
    }
    
    
}
