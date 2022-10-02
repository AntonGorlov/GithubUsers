//
//  GithubSearchAPIController.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

class GithubSearchAPIController: AnyAPIContoller, IGithubSearchAPI {
    
    public var requestBuilder: IGithubSearchAPIRequestBuilder = GithubSearchAPIRequestsFactory()
    
    public func getSearchRepositories(with requestData: SearchRepositoryRequestData,
                                      completion: @escaping SearchRepositoryResult) {
        
        do {
            
            let request = try requestBuilder.getSearchRepositories(with: requestData,
                                                                   encoder: self.encoder)
            
            typealias Response = Result<SearchRepositoriesResponseData, RequestExecutionError>
            
            self.requestExecuter.execute(request, decoder: self.decoder) { (result: Response) in
                
                switch result {
                    
                case .success(let response):
                    
                    completion(.success(response))
                    
                case .failure(let executionError):
                    
                    completion(.failure(.requestExecutionError(executionError)))
                }
                
            }
        }
        catch let error as RequestBuildingError {
            
            completion(.failure(.requestBuildingError(error)))
        }
        catch {
            
            completion(.failure(.requestBuildingError(.unexpected(error))))
        }
    }
    
    
}
