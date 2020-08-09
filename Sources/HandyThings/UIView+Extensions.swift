//
//  File.swift
//  
//
//  Created by Home Dudycz on 07/08/2020.
//

import UIKit

public extension UIView {

    func fadeIn(_ duration: TimeInterval = 0.5, to alpha: CGFloat = 1.0, completion: ((Bool) -> Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        UIView.animate(
            withDuration: duration, 
            animations: { self.alpha = alpha },
            completion: completion
        )
    }

    func fadeOut(_ duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: duration, 
            animations: { self.alpha = 0 },
            completion: {
                self.isHidden = true
                completion?($0)
            }
        )
    }

}
