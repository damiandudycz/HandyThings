//
//  File.swift
//  
//
//  Created by Home Dudycz on 20/08/2020.
//

import Foundation
import Combine

public class PagedDataSource<DataType> {
 
    public init() {}
    
    @CurrentValue
    public var isInProgress = false
    
    public var containsMorePages: Bool { currentPage < pagesCount }
    
    @CurrentValue
    public private(set) var data = [DataType]()
    
    public private(set) var currentPage = 0
    public private(set) var pagesCount  = 1
    
    private var cancellable: AnyCancellable?
    
    public private(set) var activityToken: ActivityToken? {
        didSet {
            if let activityToken = activityToken {
                activityToken.$state.map({ $0 == .inProgress }).assign(to: \.isInProgress, onUnowned: self).store(in: &cancellable)
            }
            else {
                cancellable = nil
                isInProgress = false
            }
        }
    }
    
    public let errorSubject = PassthroughSubject<Error, Never>()

    public func clear() {
        if let activityToken = activityToken {
            activityToken.cancel()
            self.activityToken = nil
        }
        currentPage = 0
        pagesCount  = 1
        data.removeAll()
    }
    
    enum GetNextPageError: Error {
        case isInProgress
        case noMorePages
    }
    
    public typealias GetPageCompletionBlock = (_ result: Result<(currentPage: Int, pagesCount: Int, pageData: [DataType]), Error>) -> Void
    
    @discardableResult public func getNextPage(using function: (_ currentPage: Int, _ activityToken: ActivityToken, _ completionBlock: @escaping GetPageCompletionBlock) -> Void) -> Result<ActivityToken, Error> {
        guard activityToken?.state != .inProgress else { 
            return .failure(GetNextPageError.isInProgress) 
        }
        guard containsMorePages else {
            return .failure(GetNextPageError.noMorePages)
        }
        let activityToken = ActivityToken()
        self.activityToken = activityToken
        function(currentPage, activityToken) { [weak self] (result) in
            guard let self = self else { return }
            guard activityToken.state == .inProgress else { return }
            switch result {
            case .success(let data):
                self.currentPage = data.currentPage
                self.pagesCount  = data.pagesCount
                self.data.append(contentsOf: data.pageData)
            case .failure(let error):
                self.errorSubject.send(error)
            }
            self.activityToken = nil
            activityToken.finish()
        }
        return .success(activityToken)
    }
    
}
