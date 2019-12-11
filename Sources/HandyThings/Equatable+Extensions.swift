//
//  Equatable+Extensions.swift
//  
//
//  Created by Home Dudycz on 11/12/2019.
//

public extension Equatable {

    func equalsAnyOf(_ values: Self...) -> Bool {
        values.contains { (element) in element == self }
    }

}
