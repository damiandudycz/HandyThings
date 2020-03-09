//
//  HandyThings.swift
//  
//
//  Created by Damian Dudycz on 09/12/2019.
//

import UIKit

public func fatalError<ErrorType: RawRepresentable>(_ error: ErrorType) -> Never where ErrorType.RawValue == String {
    fatalError(error.rawValue)
}

public var isApplicationActive: Bool {
    UIApplication.shared.applicationState == .active
}
