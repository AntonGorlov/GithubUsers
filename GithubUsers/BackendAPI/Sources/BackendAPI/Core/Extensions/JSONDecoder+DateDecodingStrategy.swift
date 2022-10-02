//
//  JSONDecoder+DateDecodingStrategy.swift
//  
//
//  Created by Anton Gorlov on 23.08.2022.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    
    static func customByCodingKey(
        
        _ formatterForKey: @escaping (CodingKey) throws -> DateFormatter?
    
    ) -> JSONDecoder.DateDecodingStrategy {
        
        return .custom({ (decoder) -> Date in
            
            guard let codingKey = decoder.codingPath.last else {
                
                throw DecodingError.dataCorrupted(
                    
                    DecodingError.Context(
                        
                        codingPath: decoder.codingPath,
                        debugDescription: "No Coding Path Found"
                    )
                )
            }
            
            guard let container = try? decoder.singleValueContainer(),
                  let text = try? container.decode(String.self)
                    
            else {
                
                throw DecodingError.dataCorrupted(
                    
                    DecodingError.Context(
                        
                        codingPath: decoder.codingPath,
                        debugDescription: "Could not decode date text"
                    )
                )
            }
            
            guard let dateFormatter = try formatterForKey(codingKey) else {
                
                throw DecodingError.dataCorruptedError(
                    
                    in: container,
                    debugDescription: "No date formatter for date text"
                )
            }
            
            if let date = dateFormatter.date(from: text) {
                
                return date
            }
            else {
                
                throw DecodingError.dataCorruptedError(
                    
                    in: container,
                    debugDescription: "Cannot decode date string \(text)"
                )
            }
            
        })
        
    }
    
    static var `default`: Self {
        
        .custom({ (decoder) -> Date in
            
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            let isoFormatter = ISO8601DateFormatter()
            
            let options: [ISO8601DateFormatter.Options] = [
                
                .withFullDate,
                .withTime,
                .withDashSeparatorInDate,
                .withColonSeparatorInTime
            ]
            
            isoFormatter.timeZone = .autoupdatingCurrent
            isoFormatter.formatOptions = .init(options)
            
            if let date = isoFormatter.date(from: dateString) {
                
                return date
            }
            
            throw DecodingError.dataCorrupted(
                
                DecodingError.Context(
                    
                    codingPath: decoder.codingPath,
                    debugDescription: "Could not decode date with format \(dateString)"
                )
            )
            
        })
    }
    
}
