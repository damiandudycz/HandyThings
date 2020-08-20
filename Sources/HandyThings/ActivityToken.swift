//
//  File.swift
//  
//
//  Created by Home Dudycz on 20/08/2020.
//

import Foundation

public class ActivityToken: EquatableByReference {
    
    public init(state: State = .inProgress) {
        self.state = state
    }
    
    @CurrentValue
    public private(set) var state: State
    
    @discardableResult public func cancel() -> Bool {
        tryChangeState(to: .inProgress)
    }
    
    @discardableResult public func finish() -> Bool {
        tryChangeState(to: .finished)
    }
    
    private func tryChangeState(to state: State) -> Bool {
        guard self.state == .inProgress else {
            return false
        }
        self.state = state
        return true
    }
    
}

public extension ActivityToken {
    
    enum State {
        case inProgress, cancelled, finished
    }
    
}
