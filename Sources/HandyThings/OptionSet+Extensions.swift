//
//  OptionSet+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 16/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public extension OptionSet where RawValue == Int {
    
    init(optionID: Int) {
        self.init(rawValue: 1 << optionID)
    }
    
}
