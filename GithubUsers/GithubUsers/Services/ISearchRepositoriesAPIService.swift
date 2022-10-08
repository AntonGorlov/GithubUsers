//
//  ISearchRepositoriesAPIService.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 05.10.2022.
//

import Foundation
import BackendAPI
import Combine

/// Interface for API service
protocol ISearchRepositoriesAPIService {
    
    var searchAPIAdapter: ISearchRepositoriesAdapter { get }
    
    typealias SearchRepositoriesResult = AnyPublisher<[SearchRepositoryModel], SearchRepositoriesError>
    
    func getSearchRepositoriesWithSortAndStars(query: String) -> SearchRepositoriesResult
}
