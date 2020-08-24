//
//  File.swift
//  
//
//  Created by Home Dudycz on 07/08/2020.
//

import CoreGraphics

public extension CGAffineTransform {
    
    static func concatenating(_ transforms: CGAffineTransform...) -> CGAffineTransform {
        transforms.reduce(CGAffineTransform.identity) { (result, transform) in
            result.concatenating(transform)
        }
    }
    
}
