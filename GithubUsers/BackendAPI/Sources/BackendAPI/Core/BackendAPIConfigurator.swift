//
//  BackendAPIConfigurator.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

let MISS_CONFIG_FATAL_ERROR = "Missing required BackendAPIConfigurator.configuration. Set it by configure method"

public class BackendAPIConfigurator {
    
    public static let shared = BackendAPIConfigurator()
    
    public private(set) var configuration: Configuration?
    
    public func configure(baseURL url: URL) {
        
        self.configuration = Configuration(baseURL: url)
    }
    
    public func configure(_ configuration: Configuration) {
        
        self.configuration = configuration
    }
    
}
