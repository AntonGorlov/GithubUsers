//
//  MapperTest.swift
//  GithubUsersTests
//
//  Created by Anton Gorlov on 08.10.2022.
//

import XCTest
import BackendAPI
@testable import GithubUsers

class MapperTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testNotOptionalMappableTypeAndReturnType() {
        
        let responseData = getStaticResponseDataForMapperWithoutOptionalType()
        
        let models = Mapper<[SearchRepositoryModel]>().map(responseData)
        
        XCTAssertFalse(models.isEmpty)
    }
    
    func testOptionalMappableTypeAndReturnType() throws {
        
        let responseData = getStaticResponseDataForMapperWithOptionalType()
        
        let models = Mapper<[SearchRepositoryModel]>().map(responseData)
        
        let unwrappedModels = try XCTUnwrap(models, "Models are not unwrapped")
        XCTAssertFalse(unwrappedModels.isEmpty)
    }
    
    //Helpers
    
    private func getStaticResponseDataForMapperWithoutOptionalType() -> SearchRepositoriesResponseData {
        
        return try! JSONDecoder().decode(SearchRepositoriesResponseData.self,
                                          from: self.replacementJSON)
    }
    
    private func getStaticResponseDataForMapperWithOptionalType() -> SearchRepositoriesResponseData? {
        
        return try? JSONDecoder().decode(SearchRepositoriesResponseData.self,
                                         from: self.replacementJSON)
    }
    
    private let replacementJSON = Data(
    """
    {
    
      "items" : [
    
        {
           "name" : "myName",
           "language" : "UA",
           "stargazers_count" : 1,
           "owner" : {
                 "login" : "loginTest",
                 "avatar_url" : "avatar1",
                 "html_url" : "someURLiOS"
           },
        },
        {
           "name" : "yoName",
           "language" : "UA",
           "stargazers_count" : 2,
           "owner" : {
                 "login" : "loginTest",
                 "avatar_url" : "avatar2",
                 "html_url" : "someURL.Net"
           },
        }
      ]
    
    }
    """.utf8)
    
}
