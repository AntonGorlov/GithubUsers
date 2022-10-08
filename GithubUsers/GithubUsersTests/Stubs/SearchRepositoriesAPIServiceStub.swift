//
//  SearchRepositoriesAPIServiceStub.swift
//  GithubUsersTests
//
//  Created by Anton Gorlov on 05.10.2022.
//

import Foundation
import BackendAPI
import Combine
@testable import GithubUsers

/// Repositories API service stub
class SearchRepositoriesAPIServiceStub: ISearchRepositoriesAPIService {
    
    var searchAPIAdapter: ISearchRepositoriesAdapter = SearchRepositoriesAdapter()
    
    
    func getSearchRepositoriesWithSortAndStars(query: String) -> SearchRepositoriesResult {
        
        let firstObject = SearchRepositoryModel(name: "Tim Cook",
                                                login: "ggvp",
                                                language: "iOS",
                                                stars: 5000,
                                                imageURL: "SomeImageURL",
                                                userURL: "SomeUserImageURL")
                                                
        let secondObject = SearchRepositoryModel(name: "Batman",
                                                 login: "bat123",
                                                 language: ".Net",
                                                 stars: 123,
                                                 imageURL: "SomeURL",
                                                 userURL: "SomeBatmanURL")
                                                
        let data = [firstObject, secondObject]
        
        return Just((data))
            .flatMap({ response -> SearchRepositoriesResult in
                
                return Future { promise in

                    guard !response.isEmpty else {
                        
                        promise(.failure(.emptySearchRepositoriesResult))
                        return
                    }
                    
                    promise(.success(response))
                }
                .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }
}
    
