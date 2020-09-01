//
//  File.swift
//  
//
//  Created by Home Dudycz on 01/09/2020.
//

import CoreGraphics

public extension CGPoint {
    
    func rotatedAroundPoint(_ point: CGPoint, angle: CGFloat) -> Self {        
        let c = cos(angle)
        let s = sin(angle)
        let v = CGPoint(x: x - point.x, y: y - point.y)
        
        let x = c * v.x - s * v.y + point.x
        let y = s * v.x + c * v.y + point.y
        
        return CGPoint(x: x, y: y)
    }
    
}
