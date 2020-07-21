//
//  Array+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public extension Array where Element: Equatable {
    
    typealias ValuesChange = (added: [Element], removed: [Element])
    
    static func valuesChange(added: [Element]) -> ValuesChange {
        ValuesChange(added: added, removed: [])
    }
    static func valuesChange(removed: [Element]) -> ValuesChange {
        ValuesChange(added: [], removed: removed)
    }

    func values(addedToOldValue oldValue: [Element]) -> [Element] {
        filter { (element) in !oldValue.contains { $0 == element } }
    }
    
    func values(removedFromOldValue oldValue: [Element]) -> [Element] {
        oldValue.filter { (element) in !contains { $0 == element } }
    }
    
    func change(fromOldValue oldValue: [Element]) -> ValuesChange {
        (values(addedToOldValue: oldValue), values(removedFromOldValue: oldValue))
    }

    mutating func apply(change: ValuesChange) {
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

public extension Array where Element: OptionSet {
    
    var joined: Element {
        reduce(Element()) { $0.union($1) }
    }
    
}

public extension Array {
    
    func forEachWithIndex(_ body: (_ element: Element, _ index: Int) -> Void) {
        for i in 0..<count {
            let element = self[i]
            body(element, i)
        }
    }
    
    func mapWithIndex<NewType>(_ body: (_ element: Element, _ index: Int) -> NewType) -> [NewType] {
        var newArray = [NewType]()
        forEachWithIndex { (element, index) in
            newArray.append(body(element, index))
        }
        return newArray
    }
    
}
