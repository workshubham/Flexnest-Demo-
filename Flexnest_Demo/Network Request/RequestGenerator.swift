//
//  RequestGenerator.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation
import Alamofire

// Endpoints for base url
enum Endpoint {
    case getUsers(Int)
}

// MARK: EndPoint Extension
// Creating & Appending Endpoints to the URL
extension Endpoint {
    
    var endPoint: String {
        
        switch self {
        
        case .getUsers(let page):
            return "users?page=\(page)"
        }
    }
}

// MARK: Reguest Generator Protocol
// Header Param
protocol RequestGeneratorProtocol {
    
    var headerParams: HTTPHeaders? {get}
}

// MARK: Request Generator Protocol Extension
extension RequestGeneratorProtocol {
    
    // Creating Headers
    var headerParams: HTTPHeaders? {
        
        get {
            
            return nil
        }
    }
    
    // Get Complete Url
    func completeUrl(endpoint: Endpoint) -> String {
        
        let urlString = BaseUrl + endpoint.endPoint
        return urlString
    }
}
