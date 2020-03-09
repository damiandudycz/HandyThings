//
//  EquatableByReference.swift
//  
//
//  Created by Damian Dudycz on 10/12/2019.
//

public protocol EquatableByReference: AnyObject, Equatable {}
public extension EquatableByReference {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs === rhs
    }
}

