//
//  AnyAPIContoller.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

public class AnyAPIContoller {
    
    internal lazy var encoder: JSONEncoder = {
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        return encoder
    }()
    
    internal lazy var decoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .default
        
        return decoder
    }()
    
    internal var requestExecuter: IRequestExecuter = AlamofireRequestExecuter()
    
    public init() {}
    
}
