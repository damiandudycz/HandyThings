//
//  ValueContainer.swift
//  
//
//  Created by Home Dudycz on 16/12/2019.
//

/// Use to encapsulate value type as reference type to achieve shared value.
class ValueContainer<Type> {
    
    var value: Type
    
    init(_ value: Type) {
        self.value = value
    }
    
}
