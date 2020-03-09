//
//  UIDevice+Extensions.swift
//  
//
//  Created by Damian Dudycz on 16/12/2019.
//

import UIKit

public extension UIDevice {
    
    static let modelIdentifier: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce(String()) { (identifier, element) in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()
    
}
