//
//  CGSize+Extensions.swift
//  
//
//  Created by Damian Dudycz on 05/02/2020.
//

import CoreGraphics

public extension CGSize {
    
    init(square: CGFloat) {
        self.init(width: square, height: square)
    }
    
}
