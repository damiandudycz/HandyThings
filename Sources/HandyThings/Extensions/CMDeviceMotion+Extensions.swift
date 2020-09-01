//
//  File.swift
//  
//
//  Created by Home Dudycz on 01/09/2020.
//

import Foundation
import CoreMotion

public extension CMDeviceMotion {
    
    // Returns compass direction unaffected by the rotation of the device.
    var compassDirection: Double {
        let cY = cos(attitude.yaw),
            sY = sin(attitude.yaw),
            sP = sin(attitude.pitch),
            cR = cos(attitude.roll),
            sR = sin(attitude.roll)
        let rY = cY * sR + sY * sP * cR
        let rP = sY * sR - cY * sP * cR
        let compassDirection = atan(rY / rP) - .pi / 2 // -pi ... pi
        if rP > 0 { return compassDirection + .pi } // Fix for rotating upside down
        return compassDirection
    }
    
    var rotation: Double { atan2(gravity.x, gravity.y) + .pi }

    // This value is available directly in CMDeviceMotion. It could be calculated like this:
    //    var heading: DeviceOrientation {
    //        // Compensate compass rotation for device rotation.
    //        return (compassDirection - rotation).rotateTo(.pi * 2)
    //    }
    
}
