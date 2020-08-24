//
//  Set+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public extension Set {
        
    static func valuesChange(added: Self) -> Change {
        Change(added: added, removed: Self())
    }
    
    static func valuesChange(removed: Self) -> Change {
        Change(added: Self(), removed: removed)
    }
    
    func values(addedToOldValue oldValue: Self) -> Self {
        subtracting(oldValue)
    }
    
    func values(removedFromOldValue oldValue: Self) -> Self {
        oldValue.subtracting(self)
    }
    
    func change(fromOldValue oldValue: Self) -> Change {
        Change(added: values(addedToOldValue: oldValue), removed: values(removedFromOldValue: oldValue))
    }
    
    mutating func apply(change: Change) {
        self = subtracting(change.removed).union(change.added)
    }
    
    mutating func insert(contentsOf set: Self) {
        self = union(set)
    }
    
    mutating func remove(contentsOf set: Self) {
        self = filterSet { !set.contains($0) }
    }
    
    func filterSet(_ isIncluded: (Element) throws -> Bool) rethrows -> Self {
        try Self(filter(isIncluded))
    }
    
    func except(_ element: Element?) -> Self {
        guard let element = element else { return self }
        var newSet = self
        newSet.remove(element)
        return newSet
    }
    
}
