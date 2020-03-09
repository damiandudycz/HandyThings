//
//  DispatchQueue+InitWithRawRepresentable.swift
//  
//
//  Created by Damian Dudycz on 10/12/2019.
//

import Foundation

public extension DispatchQueue {

    convenience init<EnumType: RawRepresentable>(label: EnumType) where EnumType.RawValue == String {
        self.init(label: label.rawValue)
    }

}
