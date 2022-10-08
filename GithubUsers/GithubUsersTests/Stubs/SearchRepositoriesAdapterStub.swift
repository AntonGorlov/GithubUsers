//
//  SearchRepositoriesAdapterStub.swift
//  GithubUsersTests
//
//  Created by Anton Gorlov on 03.10.2022.
//

import Foundation
import Combine
import BackendAPI

@testable import GithubUsers

/// Repositories adapter stub
class SearchRepositoriesAdapterStub: ISearchRepositoriesAdapter {
    
    var searchAPI: IGithubSearchAPI = GithubSearchAPIController()
    
    func getSearchRepositoriesWithSortAndStars(requestData: SearchRepositoryRequestData) -> GetSearchRepositoriesResult {
        
        let responseData = try! JSONDecoder().decode(SearchRepositoriesResponseData.self,
                                          from: self.replacementJSON)
        
        return Just((responseData))
            .flatMap { response -> GetSearchRepositoriesResult in
                
                return Future { promise in
                    
                    guard !response.items.isEmpty else {
                        
                        promise(.failure(.requestExecutionError(.dataIsEmpty)))
                        return
                    }
                    promise(.success(response))
                }
                .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    private let replacementJSON = Data(
    """
    {
    
      "items" : [
    
        {
           "name" : "TestName",
           "language" : "iOS",
           "stargazers_count" : 12345,
           "owner" : {
                 "login" : "TestLogin",
                 "avatar_url" : "http://testAvatarUrl",
                 "html_url" : "http://testHTMLUrl"
           },
        },
        {
           "name" : "TestBackendName",
           "language" : ".Net",
           "stargazers_count" : 0,
           "owner" : {
                 "login" : "TestBackendLogin",
                 "avatar_url" : "http://testBackendAvatarUrl",
                 "html_url" : "http://testBackendHTMLUrl"
           },
        }
      ]
    
    }
    """.utf8)
    
}
