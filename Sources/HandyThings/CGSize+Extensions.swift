//
//  CGSize+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 05/02/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    
    init(square: CGFloat) {
        self.init(width: square, height: square)
    }
    
}
