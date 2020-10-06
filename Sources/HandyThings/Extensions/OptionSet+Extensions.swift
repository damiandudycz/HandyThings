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

public protocol OptionSetInitiableByName {
    init?(name: String)
    static var named: [String : Self] { get }
}

public extension OptionSetInitiableByName where Self: OptionSet {
    init?(name: String) {
        guard let match = Self.named[name] else { return nil }
        self = match            
    }
    init(names: [String]) {
        self = names.compactMap({ Self(name: $0) }).joined
    }
}
