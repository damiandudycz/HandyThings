//
//  Set+Extensions.swift
//  
//
//  Created by Home Dudycz on 10/12/2019.
//

public extension Set {
    
    typealias Change = (added: Set, removed: Set)
    
    static func change(added: Set) -> Change {
        Change(added: added, removed: Set())
    }
    
    static func change(removed: Set) -> Change {
        Change(added: Set(), removed: removed)
    }
    
    func objects(addedToOldValue oldValue: Set) -> Set {
        subtracting(oldValue)
    }
    
    func objects(removedFromOldValue oldValue: Set) -> Set {
        oldValue.subtracting(self)
    }
    
    func change(fromOldValue oldValue: Set) -> Change {
        (objects(addedToOldValue: oldValue), objects(removedFromOldValue: oldValue))
    }
    
    mutating func apply(change: Change) {
        self = subtracting(change.removed).union(change.added)
    }
    
    mutating func insert(contentsOf set: Set) {
        self = union(set)
    }
    
    mutating func remove(contentsOf set: Set) {
        self = filterSet { !set.contains($0) }
    }
    
    func filterSet(_ isIncluded: (Element) throws -> Bool) rethrows -> Set {
        try Set(filter(isIncluded))
    }
    
    func except(_ element: Element?) -> Set {
        guard let element = element else { return self }
        var newSet = self
        newSet.remove(element)
        return newSet
    }
    
}
