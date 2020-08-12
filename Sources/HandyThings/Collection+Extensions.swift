//
//  File.swift
//  
//
//  Created by Home Dudycz on 13/08/2020.
//

import Foundation

public extension Collection {
    
    typealias Change = (added: Self, removed: Self)

    func min<Value: Comparable>(_ key: KeyPath<Element, Value>) -> Element? {
        self.min(by: { $0[keyPath: key] < $1[keyPath: key] })
    }
    
    func max<Value: Comparable>(_ key: KeyPath<Element, Value>) -> Element? {
        self.max(by: { $0[keyPath: key] < $1[keyPath: key] })
    }

}
