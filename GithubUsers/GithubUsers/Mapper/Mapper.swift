//
//  Mapper.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 08.10.2022.
//

import Foundation

/// Mapper for map from requestData to UI model
struct Mapper<ReturnType> {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    /// - Returns: <#description#>
    func map<MappableType>(_ model: MappableType) -> ReturnType {
        
        fatalError("Mapper did not find an available overload: \(MappableType.self) -> \(ReturnType.self)")
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    func map<MappableType>(_ model: MappableType) -> ReturnType? {
        
        fatalError("Mapper did not find an available overload: \(MappableType.self) -> \(ReturnType.self)")
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    func map<MappableType>(_ model: MappableType?) -> ReturnType? {
        
        fatalError("Mapper did not find an available overload: \(MappableType.self) -> \(ReturnType.self)")
    }
}
