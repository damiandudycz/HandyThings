//
//  Array+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public extension Array where Element: Equatable {
    
    typealias ValuesChange = (added: Self, removed: Self)
    
    static func valuesChange(added: Self) -> ValuesChange {
        ValuesChange(added: added, removed: [])
    }
    static func valuesChange(removed: Self) -> ValuesChange {
        ValuesChange(added: [], removed: removed)
    }

    func values(addedToOldValue oldValue: Self) -> Self {
        filter { (element) in !oldValue.contains { $0 == element } }
    }
    
    func values(removedFromOldValue oldValue: Self) -> Self {
        oldValue.filter { (element) in !contains { $0 == element } }
    }
    
    func change(fromOldValue oldValue: Self) -> ValuesChange {
        (values(addedToOldValue: oldValue), values(removedFromOldValue: oldValue))
    }

    mutating func apply(change: ValuesChange) {
        var newArray = filter { (element) in !change.removed.contains { $0 == element } }
        newArray.append(contentsOf: change.added)
        self = newArray
    }

    mutating func remove(contentsOf objects: Self) {
        self = filter { (element) in !objects.contains { $0 == element } }
    }
    
    mutating func remove(object: Element) {
        self = filter { $0 != object }
    }
    
}

public extension Array where Element: OptionSet {
    
    var joined: Element {
        reduce(Element()) { $0.union($1) }
    }
    
}
