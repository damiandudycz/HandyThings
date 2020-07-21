//
//  File.swift
//  
//
//  Created by Home Dudycz on 12/06/2020.
//

import Foundation

public extension Data {
    
    enum ConversionError: Error {
        case failedToConvertToData
    }
    
    mutating func append(_ string: String) throws {
        guard let data = string.data(using: .utf8) else {
            throw ConversionError.failedToConvertToData
        }
        append(data)
    }
    
}
