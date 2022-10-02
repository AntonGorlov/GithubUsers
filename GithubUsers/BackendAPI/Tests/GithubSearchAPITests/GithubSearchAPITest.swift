//
//  GithubSearchAPITest.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import XCTest
@testable import BackendAPI

/// In this file, we test the actual operation of our request, which is sent to us by the backend. We find and fix errors in the implementation of the backend layer. In other cases, we should not use real backend network requests in tests, since tests should be fast, repeatable, understandable and we do not know when there will be a response and when there are many requests they affect the rest of the tests. That's why I wrote this test inside the backend layer
class GithubSearchAPITest: XCTestCase {
    
    /// # Summary
    /// <#Test Summary#>
    ///
    /// # System under test
    /// - **Protocol**: <#SUT#>
    /// - **Implementation**: <#SUT#>
    ///
    /// # Preconditions
    /// - <#Preconditions#>
    ///
    /// # Conditions to test
    /// <#Test Conditions#>
    ///
    /// # Test scenario
    /// 1. <#Step 1#>
    /// 2. <#Step 2#>
    
    func testGetSearchRepositoriesWithSortAndStars() throws {
        
        //Given

        let sut = try self.makeSUT()
        let expectation = XCTestExpectation()
        let requestData = SearchRepositoryRequestData(query: "language=+sort:stars") // value into a cURL
        
        //When
        
        var totalResult = SearchRepositoriesResponseData(items: [SearchRepositoryResponseData]())
        
        sut.getSearchRepositories(with: requestData) { result in
            
            switch result {
                
            case .success(let response):
                
                totalResult = response
                
            case .failure(let error):
                
                XCTFail("\(error)")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        //Then
        
        XCTAssertFalse(totalResult.items.isEmpty, "An array of repositories is empty")
    }
    
    private func makeSUT() throws -> GithubSearchAPIController {
        
        let baseURL = URL(string: "https://api.github.com")
        
        let unwrappedURL = try XCTUnwrap(baseURL)
        
        BackendAPIConfigurator.shared.configure(baseURL: unwrappedURL)
        
        return GithubSearchAPIController()
    }
}
