//
//  SearchRepositoryRequestData.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

public struct SearchRepositoryRequestData: Encodable {
    
    public let query: String
    
    public init(query: String) {
        
        self.query = query
    }
    
    enum CodingKeys: String, CodingKey {
        
        case query = "q"
    }
}
