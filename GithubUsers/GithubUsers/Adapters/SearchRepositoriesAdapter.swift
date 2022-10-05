//
//  SearchRepositoriesAdapter.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 03.10.2022.
//

import Foundation
import Combine
import BackendAPI

/// Repositories adapter stub
class SearchRepositoriesAdapter: ISearchRepositoriesAdapter {
    
    var searchAPI: IGithubSearchAPI = GithubSearchAPIController()
    
    func getSearchRepositoriesWithSortAndStars(requestData: SearchRepositoryRequestData) -> GetSearchRepositoriesResult {
        
        return Future { promise in
            
            self.searchAPI.getSearchRepositories(with: requestData) { result in
                
                switch result {
                    
                case .success(let response):
                    
                    if !response.items.isEmpty {
                        
                        promise(.success(response))
                        
                    }
                    promise(.failure(.requestExecutionError(.dataIsEmpty)))
                    
                case .failure(let error):
                    
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

