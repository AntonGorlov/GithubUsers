//
//  GithubSearchAPIRequestsFactory.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation
import Alamofire

class GithubSearchAPIRequestsFactory: IGithubSearchAPIRequestBuilder {
    
    var endpointsBuilder: IGithubSearchAPIEndpointsBuilder
    
    init() {
        
        self.endpointsBuilder = GithubSearchAPIEndpointsFactory()
    }
    
    func getSearchRepositories(with requestData: SearchRepositoryRequestData,
                               encoder: JSONEncoder) throws -> URLRequest {
        
        do {
            
            guard let configuration = BackendAPIConfigurator.shared.configuration else {
                
                fatalError(MISS_CONFIG_FATAL_ERROR)
            }
            
            let endPoint = self.endpointsBuilder.getSearchRepositoriesWithSortAndStars
            
            let headers = HTTPHeaders(configuration.commonHeaders)
            
            let request = AF.request(endPoint,
                                     method: .get,
                                     parameters: requestData,
                                     headers: headers)
            
            return try request.convertible.asURLRequest()
        }
        catch let error as EncodingError {
            
            throw RequestBuildingError.serializationError(error)
        }
        catch let initializationError {
            
            throw RequestBuildingError.urlRequestInitializationError(initializationError)
        }
    }
    
    
}
