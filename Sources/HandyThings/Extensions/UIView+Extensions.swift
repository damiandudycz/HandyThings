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
    
    func stickToEdges(in view: UIView) {
        view.addConstraints([
            NSLayoutConstraint(item: self, attribute: .leading,  relatedBy: .equal, toItem: view, attribute: .leading,  multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self, attribute: .top,      relatedBy: .equal, toItem: view, attribute: .top,      multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self, attribute: .bottom,   relatedBy: .equal, toItem: view, attribute: .bottom,   multiplier: 1.0, constant: 0.0)
        ])
    }

}
