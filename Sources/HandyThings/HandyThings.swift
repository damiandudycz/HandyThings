//
//  HandyThings.swift
//  
//
//  Created by Home Dudycz on 09/12/2019.
//

public func fatalError<ErrorType: RawRepresentable>(_ error: ErrorType) -> Never where ErrorType.RawValue == String {
    fatalError(error.rawValue)
}
