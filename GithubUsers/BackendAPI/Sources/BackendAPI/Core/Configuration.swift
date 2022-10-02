//
//  Configuration.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

public struct Configuration {
    
    public var baseURL: URL
    
    //Headers
    var commonHeaders: [String : String] = [
        
        "Content-Type" : "application/json"
    ]
}
