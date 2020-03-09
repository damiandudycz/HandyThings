//
//  URL+Extensions.swift
//  
//
//  Created by Damian Dudycz on 11/12/2019.
//

import Foundation

public extension URL {

    init?<Type: RawRepresentable>(filename: Type, relativeTo url: URL? = nil) where Type.RawValue == String {
        self.init(string: filename.rawValue, relativeTo: url)
    }
    
    init?<Type: RawRepresentable>(baseURL: Type, parameters: [String : CustomStringConvertible]) where Type.RawValue == String {
        self.init(baseURLString: baseURL.rawValue, parameters: parameters)
    }
    
    init?(baseURLString: String, parameters: [String : CustomStringConvertible]) {
        let parametersStrings = parameters.map { (arg) -> String in
            let (key, value) = arg
            guard let urlKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                fatalError()
            }
            guard let urlValue = value.description.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                fatalError()
            }
            return "\(urlKey)=\(urlValue)"
        }
        let fullURLString = "\(baseURLString)?\(parametersStrings.joined(separator: "&"))"
        self.init(string: fullURLString)
    }
}
