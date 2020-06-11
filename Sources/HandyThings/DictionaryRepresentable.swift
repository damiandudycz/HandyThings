//
//  File.swift
//  
//
//  Created by Home Dudycz on 08/06/2020.
//

import Foundation

public protocol DictionaryRepresentable: Encodable {
    
    func dictionary() throws -> [String : CustomStringConvertible]
        
}

public extension DictionaryRepresentable {

    // TODO: Replace with use of DictionaryDecoder from https://stackoverflow.com/questions/45209743/how-can-i-use-swift-s-codable-to-encode-into-a-dictionary
    func dictionary() throws -> [String : CustomStringConvertible] {
        guard let dictionary = try DictionaryEncoder().encode(self) as? [String : CustomStringConvertible] else {
            throw DictionaryRepresentableError.failedToConvertToDictionary
        }
        return dictionary
    }
    
}

extension Dictionary: DictionaryRepresentable where Key == String, Value == String {}

public enum DictionaryRepresentableError: Error {
    case failedToConvertToDictionary
}
