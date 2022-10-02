//
//  AlamofireRequestExecuter.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation
import Alamofire

class AlamofireRequestExecuter: IRequestExecuter {
    
    let acceptableStatusCodes  = 200..<300
    let acceptableContentTypes = ["application/json", "application/x-www-form-urlencoded"]
    
    init() {
        
        AF.sessionConfiguration.timeoutIntervalForRequest  = 15
        AF.sessionConfiguration.timeoutIntervalForResource = 10
    }
    
    func execute(_ request: URLRequest,
                 completion: @escaping (Result<Void, RequestExecutionError>) -> Void)
    {
        guard Reachability.isConnectedToNetwork() else {
            
            completion(.failure(.networkUnavailable)); return
        }
        
        let dataRequest = self.getDataRequest(form: request)
        
        dataRequest
            .validate(statusCode: self.acceptableStatusCodes)
            .validate(contentType: self.acceptableContentTypes)
            .response { (response) in
                if let code = response.response?.statusCode,
                   self.acceptableStatusCodes.contains(code)
                {
                    completion(.success(())); return
                }
                else if let error = response.error {
                    
                    let executionError = self.mapError(error)
                    completion(.failure(executionError)); return
                }
                else {
                    
                    completion(.failure(.unexpected(nil))); return
                }
            }
    }
    
    func execute<T : Decodable>(_ request: URLRequest, decoder: JSONDecoder,
                                completion: @escaping (Result<T, RequestExecutionError>) -> Void)
    {
        guard Reachability.isConnectedToNetwork() else {
            
            completion(.failure(.networkUnavailable)); return
        }
        
        let dataRequest = self.getDataRequest(form: request)
        
        dataRequest
            .validate(statusCode: self.acceptableStatusCodes)
            .validate(contentType: self.acceptableContentTypes)
            .responseDecodable(of: T.self, decoder: decoder) { response in
                if let value = response.value {
                    
                    completion(.success(value)); return
                }
                else if let error = response.error {
                    
                    let executionError = self.mapError(error)
                    completion(.failure(executionError)); return
                    
                } else {
                    
                    completion(.failure(.unexpected(nil))); return
                }
            }
    }
    
    private func mapError(_ error: AFError) -> RequestExecutionError {
        
        switch error {
        
        case .sessionTaskFailed(let error as URLError) where error.code == .timedOut:
            return .timeout
        
        case .sessionTaskFailed(let error as URLError) where error.code == .networkConnectionLost:
            return .connectionInterrupted
            
        default:
            
            if let statusCode = error.responseCode {
                
                let statusError = StatusError(statusCode)
                return .httpStatusError(statusError)
            }
            else if error.isResponseSerializationError {
                
                return .serializationError(error)
            }
            else {
                
                return .unexpected(error)
            }
        }
        
    }
    
    private func getDataRequest(form urlRequest: URLRequest) -> DataRequest {
        
        return AF.request(urlRequest)
    }
    
}
