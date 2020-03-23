//
//  HashableByReference.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public protocol HashableByReference: AnyObject, Hashable {}

public extension HashableByReference {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
}
