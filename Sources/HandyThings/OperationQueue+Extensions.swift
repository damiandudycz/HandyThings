//
//  File.swift
//  
//
//  Created by Home Dudycz on 18/02/2020.
//

import Foundation

public extension OperationQueue {
    
    convenience init(maxConcurrentOperationCount: Int) {
        self.init()
        self.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
    
}
