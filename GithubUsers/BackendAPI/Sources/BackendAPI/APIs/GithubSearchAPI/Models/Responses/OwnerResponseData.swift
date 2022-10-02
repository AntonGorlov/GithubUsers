//
//  OwnerResponseData.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

/// Other users data
public struct OwnerResponseData: Decodable {
    
    public let login: String
    
    public let imageURL: String
    
    public let userURL: String
    
    enum CodingKeys: String, CodingKey {
        
        case login    = "login"
        case imageURL = "avatar_url"
        case userURL  = "html_url"
    }
}
