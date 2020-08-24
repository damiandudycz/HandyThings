//
//  File.swift
//  
//
//  Created by Home Dudycz on 23/08/2020.
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
