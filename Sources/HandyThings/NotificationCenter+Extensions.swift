//
//  NotificationCenter+Extensions.swift
//  
//
//  Created by Damian Dudycz on 10/12/2019.
//

import Foundation

public extension NotificationCenter {
    
    func addObserver(_ observer: Any, selector: Selector, name: Notification.Name?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: nil)
    }
    
    @discardableResult func addObserver(forName name: Notification.Name?, queue: OperationQueue? = nil, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        addObserver(forName: name, object: nil, queue: queue, using: block)
    }
    
}
