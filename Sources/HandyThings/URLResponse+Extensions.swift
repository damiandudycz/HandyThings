//
//  URLResponse+Extensions.swift
//  HandyThings
//
//  Created by Damian Dudycz on 11/12/2019.
//  Copyright © 2019 Damian Dudycz. All rights reserved.
//

import Foundation

extension URLResponse {
    
    public var status: ResponseStatus {
        guard let statusCode = (self as? HTTPURLResponse)?.statusCode else { return .unknown }
        return ResponseStatus(rawValue: statusCode) ?? .unknown
    }
    
    public enum ResponseStatus: Int {
        
        public enum ResponseStatusType {
            case informational
            case success
            case redirection
            case error
            case serverError
            case unknown
        }
        
        public var type: ResponseStatusType {
            switch rawValue {
            case 100...199: return .informational
            case 200...299: return .success
            case 300...399: return .redirection
            case 400...499: return .error
            case 500...599: return .serverError
            default:        return .unknown
            }
        }
        
        public var isSuccess: Bool {
            type == .success
        }
        
        case unknown = 0
        
        //Informational
        case `continue`         = 100
        case switchingProtocols = 101
        case processing         = 102
        case earlyHints         = 103
        
        // Success
        case ok                          = 200
        case created                     = 201
        case accepted                    = 202
        case nonAuthoritativeInformation = 203
        case noContent                   = 204
        case resetContent                = 205
        case partialContent              = 206
        case multiStatus                 = 207
        case alreadyReported             = 208
        case imUsed                      = 226
        
        // Redirection
        case multipleChoises   = 300
        case modedPermanently  = 301
        case found             = 302
        case seeOther          = 303
        case notModified       = 304
        case useProxy          = 305
        case switchProxy       = 306
        case temporaryRedirect = 307
        case permanentRedirect = 308
        
        // Error
        case badRequest                  = 400
        case unauthorized                = 401
        case paymentRequired             = 402
        case forbidden                   = 403
        case notFound                    = 404
        case methodNotAllowed            = 405
        case notAcceptable               = 406
        case proxyAuthenticationRequired = 407
        case requestTimeout              = 408
        case conflict                    = 409
        case gone                        = 410
        case lengthRequired              = 411
        case preconditionFailed          = 412
        case payloadTooLarge             = 413
        case uriTooLong                  = 414
        case unsupportedMediaType        = 415
        case rangeNotSatisfiable         = 416
        case expectationFailed           = 417
        case imATeapot                   = 418
        case misdirectedRequest          = 421
        case unprocessableEntity         = 422
        case locked                      = 423
        case failedDependency            = 424
        case tooEarly                    = 425
        case upgradeRequired             = 426
        case preconditionRequired        = 428
        case tooManyRequests             = 429
        case requestHeaderFieldsTooLarge = 431
        case unavailableForLegalReasons  = 451
        
        // Server error
        case internalServerError           = 500
        case notImplemented                = 501
        case badGateway                    = 502
        case serviceUnavailable            = 503
        case gatewayTimeout                = 504
        case httpVersionNotSupported       = 505
        case variantAlsoNegotiates         = 506
        case insufficientStorage           = 507
        case loopDetected                  = 508
        case notExtended                   = 510
        case networkAuthenticationRequired = 511
        
    }
    
}
