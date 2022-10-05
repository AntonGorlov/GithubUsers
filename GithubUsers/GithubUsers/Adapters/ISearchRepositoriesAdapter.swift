//
//  ISearchRepositoriesAdapter.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 03.10.2022.
//

import Foundation
import Combine
import BackendAPI

/// Interface for a search repositories adapter
protocol ISearchRepositoriesAdapter {
    
    var searchAPI: IGithubSearchAPI { get }
    
    typealias GetSearchRepositoriesResult = AnyPublisher<SearchRepositoriesResponseData, BackendAPIError>
    
    func getSearchRepositoriesWithSortAndStars(requestData: SearchRepositoryRequestData) -> GetSearchRepositoriesResult
}
