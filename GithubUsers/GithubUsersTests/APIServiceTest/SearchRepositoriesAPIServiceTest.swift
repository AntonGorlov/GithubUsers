//
//  SearchRepositoriesAPIServiceTest.swift
//  GithubUsersTests
//
//  Created by Anton Gorlov on 05.10.2022.
//

import XCTest
import BackendAPI
import Combine
@testable import GithubUsers

/// API service tests
class SearchRepositoriesAPIServiceTest: XCTestCase {

    private var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        
        cancellables = []
        let configuration = BackendAPIConfigurator.shared
        let url = URL(fileURLWithPath: "testURL")
        configuration.configure(baseURL: url)
    }
    
    func testNotEmptyResponseDataIntoAPIGetSearchRepositories() {
        
        let models = getSearchRepositoriesModelsWithTestQuery()
        
        XCTAssertFalse(models.isEmpty, "Repositories are empty")
    }
    
    func testNumberOfObjectsFoundIntoAPIGetSearchRepositories() {
        
        let models = getSearchRepositoriesModelsWithTestQuery()
        
        XCTAssertEqual(models.count, 2, "Incorrect number of objects found")
    }
    
    func testExpectedModelsFromTheReceivedSearchResultsAPIGetSearchRepositories() {
        
        let expectedFirstModel = expectedFirstModel()
        
        let expectedSecondModel = expectedSecondModel()
        
        let models = getSearchRepositoriesModelsWithTestQuery()
        
        XCTAssertTrue(models.contains(expectedFirstModel), "First model is not founded")
        XCTAssertTrue(models.contains(expectedSecondModel), "Second model is not founded")
    }
    
    //MARK: - Helpers
    
    private func expectedFirstModel() -> SearchRepositoryModel {
        
        return SearchRepositoryModel(name: "Tim Cook",
                                     login: "ggvp",
                                     language: "iOS",
                                     stars: 5000,
                                     imageURL: "SomeImageURL",
                                     userURL: "SomeUserImageURL")
    }
    
    private func expectedSecondModel() -> SearchRepositoryModel {
        
        return SearchRepositoryModel(name: "Batman",
                                     login: "bat123",
                                     language: ".Net",
                                     stars: 123,
                                     imageURL: "SomeURL",
                                     userURL: "SomeBatmanURL")
    }
    
    private func getSearchRepositoriesModelsWithTestQuery() -> [SearchRepositoryModel] {
        
        let sut = makeSUT()
        let query = "testQuery"
        
        var repositories = [SearchRepositoryModel]()
        
        sut.getSearchRepositoriesWithSortAndStars(query: query)
            .sink { result in
                
                switch result {
                    
                case .finished: break
                    
                case .failure(let error):
                  
                    XCTFail("Error description:\(error)")
                }
            } receiveValue: { repositoriesData in
                
                repositories = repositoriesData
            }
            .store(in: &self.cancellables)
        
        return repositories
    }
    
    private func makeSUT() -> SearchRepositoriesAPIServiceStub {
        
        return SearchRepositoriesAPIServiceStub()
    }
}
