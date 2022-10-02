//
//  SearchRepositoryResponseData.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

/// Search Repository Data
public struct SearchRepositoryResponseData: Decodable {
    
    public let name: String
    
    public let owner: OwnerResponseData
    
    public let language: String?
    
    public let starsCount: Int
    
    enum CodingKeys: String, CodingKey {
        
        case name       = "name"
        case owner      = "owner"
        case language   = "language"
        case starsCount = "stargazers_count"
    }
}
