//
//  EquatableByReference.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public protocol EquatableByReference: AnyObject, Equatable {}

public extension EquatableByReference {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs === rhs
    }
    
}
