//
//  DispatchQueue+InitWithRawRepresentable.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

import Foundation

public extension DispatchQueue {

    convenience init<EnumType: RawRepresentable>(label: EnumType) where EnumType.RawValue == String {
        self.init(label: label.rawValue)
    }

}
