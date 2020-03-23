//
//  HashableByReference.swift
//  
//
//  Created by Damian Dudycz on 10/12/2019.
//

public protocol HashableByReference: AnyObject, Hashable {}

public extension HashableByReference {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
}
