//
//  SearchRepositoriesResponseData.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

/// Repository response data
public struct SearchRepositoriesResponseData: Decodable {
    
    public let items: [SearchRepositoryResponseData]
    
    enum CodingKeys: String, CodingKey {
        
        case items = "items"
    }
}
