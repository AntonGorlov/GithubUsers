//
//  IRequestExecuter.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

/// <#Description#>
protocol IRequestExecuter {
    
    /// <#Description#>
    /// - Parameters:
    ///   - request: <#request description#>
    ///   - decoder: <#decoder description#>
    ///   - completion: <#completion description#>
    func execute(_ request: URLRequest,
                 completion: @escaping (Swift.Result<Void, RequestExecutionError>) -> Void)
    
    /// <#Description#>
    /// - Parameters:
    ///   - request: <#request description#>
    ///   - decoder: <#decoder description#>
    ///   - completion: <#completion description#>
    func execute<T: Decodable>(_ request: URLRequest, decoder: JSONDecoder,
                               completion: @escaping (Swift.Result<T, RequestExecutionError>) -> Void)
    
}
