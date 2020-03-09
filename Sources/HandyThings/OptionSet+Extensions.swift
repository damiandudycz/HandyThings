//
//  OptionSet+Extensions.swift
//  
//
//  Created by Damian Dudycz on 16/12/2019.
//

public extension OptionSet where RawValue == Int {
    
    init(optionID: Int) {
        self.init(rawValue: 1 << optionID)
    }
    
}
