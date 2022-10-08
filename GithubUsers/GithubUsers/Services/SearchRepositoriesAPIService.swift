//
//  SearchRepositoriesAPIService.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 08.10.2022.
//

import Foundation
import BackendAPI
import Combine

/// RepositoriesAPIService
class SearchRepositoriesAPIService: ISearchRepositoriesAPIService {
    
    var searchAPIAdapter: ISearchRepositoriesAdapter = SearchRepositoriesAdapter()
    
    func getSearchRepositoriesWithSortAndStars(query: String) -> SearchRepositoriesResult {
        
        let requestData = SearchRepositoryRequestData(query: query)
        
        return self.searchAPIAdapter
            .getSearchRepositoriesWithSortAndStars(requestData: requestData)
            .mapError { error -> SearchRepositoriesError in
                
                if let networkError = NetworkCommunicationError(from: error) {
                    
                    return .networkCommunicationError(networkError)
                }
                
                return .unexpected
            }
            .flatMap { response -> SearchRepositoriesResult in
                
                return Future { promise in
                    
                    let models = Mapper<[SearchRepositoryModel]>().map(response)
                    
                    guard !models.isEmpty else {
                        
                        promise(.failure(.emptySearchRepositoriesResult))
                        
                        return
                    }
                    promise(.success(models))
                }
                .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    
    
}
