//
//  HandyThings.swift
//  HandyThings
//
//  Created by Damian Dudycz on 09/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

import UIKit

public func fatalError<ErrorType: RawRepresentable>(_ error: ErrorType) -> Never where ErrorType.RawValue == String {
    fatalError(error.rawValue)
}

public var isApplicationActive: Bool {
    UIApplication.shared.applicationState == .active
}
