//
//  Array+Extensions.swift
//  
//
//  Created by Home Dudycz on 10/12/2019.
//

public extension Array where Element: Equatable {
    
    typealias Change = (added: [Element], removed: [Element])
    
    static func change(added: [Element]) -> Change {
        Change(added: added, removed: [])
    }
    static func change(removed: [Element]) -> Change {
        Change(added: [], removed: removed)
    }

    func objects(addedToOldValue oldValue: [Element]) -> [Element] {
        filter { (element) in !oldValue.contains { $0 == element } }
    }
    
    func objects(removedFromOldValue oldValue: [Element]) -> [Element] {
        oldValue.filter { (element) in !contains { $0 == element } }
    }
    
    func change(fromOldValue oldValue: [Element]) -> Change {
        (objects(addedToOldValue: oldValue), objects(removedFromOldValue: oldValue))
    }

    mutating func apply(change: Change) {
        var newArray = filter { (element) in !change.removed.contains { $0 == element } }
        newArray.append(contentsOf: change.added)
        self = newArray
    }

    mutating func remove(contentsOf objects: [Element]) {
        self = filter { (element) in !objects.contains { $0 == element } }
    }
    
    mutating func remove(object: Element) {
        self = filter { $0 != object }
    }
    
}
