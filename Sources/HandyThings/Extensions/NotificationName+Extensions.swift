//
//  NotificationName+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 10/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

import UIKit

public extension Notification.Name {

    static let didReceiveMemoryWarningNotification = UIApplication.didReceiveMemoryWarningNotification
    static let willResignActiveNotification        = UIApplication.willResignActiveNotification
    static let didBecomeActiveNotification         = UIApplication.didBecomeActiveNotification
    static let didEnterBackgroundNotification      = UIApplication.didEnterBackgroundNotification
    static let significantTimeChangeNotification   = UIApplication.significantTimeChangeNotification
    static let willTerminateNotification           = UIApplication.willTerminateNotification
    
    static let willChangeStatusBarOrientationNotification = UIApplication.willChangeStatusBarOrientationNotification
    
}
