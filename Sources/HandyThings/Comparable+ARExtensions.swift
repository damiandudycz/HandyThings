//
//  Comparable+ARExtensions.swift
//  AugmentedReality
//
//  Created by Damian Dudycz on 17/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public extension Comparable {
    
    func keepBetween(from: Self, to: Self) -> Self {
        .min(max(self, from), to)
    }
    
    func keepInRange(_ range: ClosedRange<Self>) -> Self {
        self.keepBetween(from: range.lowerBound, to: range.upperBound)
    }
    
    static func min(_ values: Self...) -> Self {
        values.min()!
    }
    
}
