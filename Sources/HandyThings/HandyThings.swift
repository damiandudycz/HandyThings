//
//  HandyThings.swift
//  
//
//  Created by Home Dudycz on 09/12/2019.
//

import Foundation

public func fatalError<ErrorType: RawRepresentable>(_ error: ErrorType) -> Never where ErrorType.RawValue == String {
    fatalError(error.rawValue)
}

public extension DispatchQueue {

    convenience init<EnumType: RawRepresentable>(label: EnumType) where EnumType.RawValue == String {
        self.init(label: label.rawValue)
    }

}

public protocol EquatableByReference: AnyObject, Equatable {}
public extension EquatableByReference {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs === rhs
    }
}

public protocol HashableByReference: AnyObject, Hashable {}
public extension HashableByReference {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

