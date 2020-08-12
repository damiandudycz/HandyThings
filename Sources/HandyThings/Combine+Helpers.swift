//
//  Combine+Helpers.swift
//  HandyThings
//
//  Created by Damian Dudycz on 26/05/2020.
//  Copyright © 2020 Damian Dudycz. All rights reserved.
//

import Combine

@propertyWrapper
public class CurrentValue<Value> {
    
    public var wrappedValue: Value {
        get { projectedValue.value }
        set { projectedValue.value = newValue }
    }
    
    public var projectedValue: CurrentValueSubject<Value, Never>
    
    public init(wrappedValue: Value) {
        self.projectedValue = CurrentValueSubject(wrappedValue)
    }
    
}

public extension Publisher {
    
    typealias Change = (oldValue: Output, newValue: Output)
    
    func withPrevious(initialValue: Output) -> Publishers.Scan<Self, Change> {
        let initialValue = initialValue
        return scan((oldValue: initialValue, newValue: initialValue)) { Change(oldValue: $0.1, newValue: $1) }
    }
    
}

public extension CurrentValueSubject {
        
    func withPrevious(initialValue: Output? = nil) -> Publishers.Scan<CurrentValueSubject, Change> {
        withPrevious(initialValue: initialValue ?? value)
    }
    
}

public extension Publisher where Failure == Never {
    
    func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Output>, onWeak object: Root) -> AnyCancellable where Root: AnyObject {
        sink { [weak object] (value) in
            object?[keyPath: keyPath] = value
        }
    }

    func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Output>, onUnowned object: Root) -> AnyCancellable where Root: AnyObject {
        sink { [unowned object] (value) in
            object[keyPath: keyPath] = value
        }
    }

}

public extension AnyCancellable {
    
    func store(in cancellable: inout AnyCancellable?) {
        cancellable = self
    }
    
    func store<Key: Hashable>(in dictionary: inout [Key : AnyCancellable], for key: Key) {
        dictionary[key] = self
    }
    
}
