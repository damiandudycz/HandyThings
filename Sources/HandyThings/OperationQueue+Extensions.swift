//
//  OperationQueue+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 18/02/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

import Foundation

public extension OperationQueue {
    
    convenience init(maxConcurrentOperationCount: Int) {
        self.init()
        self.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
    
}
