//
//  SearchRepositoriesAdapterTest.swift
//  GithubUsersTests
//
//  Created by Anton Gorlov on 03.10.2022.
//

import XCTest
import Combine
import BackendAPI

@testable import GithubUsers

/// Adapter's tests
class SearchRepositoriesAdapterTest: XCTestCase {

    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        
        super.setUp()
        
        cancellables = []
        let configuration = BackendAPIConfigurator.shared
        let url = URL(fileURLWithPath: "testURL")
        configuration.configure(baseURL: url)
    }
    
    func testSuccessAPIGetSearchRepositoriesWithStaticallyResponseData() {
        
        //Given
        let sut = self.makeSUT()
        
        //When
        let responseData = getResponseDataInSearchRepository(with: sut)
        
        //Then
       
        XCTAssertFalse(responseData.isEmpty, "A search result response is empty")
        XCTAssertEqual(responseData.count, 2, "The number of objects in the array does not match. look at replacementJSON")
    }
    
    func testFirstReceivedObjectPropertiesIntoResponse() {
        
        let sut = self.makeSUT()
        
        let language = "iOS"
        let name = "TestName"
        let stars = 12345
        
        let responseData = getResponseDataInSearchRepository(with: sut)
        let object = responseData[0]
        
        XCTAssertEqual(object.language, language)
        XCTAssertEqual(object.name, name)
        XCTAssertEqual(object.starsCount, stars)
    }
    
    func testFirstReceivedObjectWithLanguagePropertyIsNotNil() {
        
        let sut = self.makeSUT()
        
        let responseData = getResponseDataInSearchRepository(with: sut)
        let object = responseData[0]
        
        XCTAssertNotNil(object.language, "Language property is nil")
    }
    
    // MARK: - Helpers
    
    private func getResponseDataInSearchRepository(with sut: SearchRepositoriesAdapterStub) -> [SearchRepositoryResponseData] {
        
        var responseData = [SearchRepositoryResponseData]()
        
        sut.getSearchRepositoriesWithSortAndStars(requestData: self.requestData())
            .sink { result in
                
                switch result {
                    
                case .finished: break
                    
                case .failure(let error):
                  
                    XCTFail("Error description:\(error)")
                }
            } receiveValue: { searchResult in
                
                responseData = searchResult.items
            }
            .store(in: &self.cancellables)
        
        return responseData
    }
    
    private func requestData() -> SearchRepositoryRequestData {
        
        return SearchRepositoryRequestData(query: "test")
    }
    
    private func makeSUT() -> SearchRepositoriesAdapterStub {
        
        return SearchRepositoriesAdapterStub()
    }
}
