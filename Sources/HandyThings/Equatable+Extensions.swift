//
//  Equatable+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 11/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

public extension Equatable {

    func equalsAnyOf(_ values: [Self]) -> Bool {
        values.contains { (element) in element == self }
    }

    func equalsAnyOf(_ values: Self...) -> Bool {
        equalsAnyOf(values)
    }

}
