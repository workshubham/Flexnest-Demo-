//
//  Utility.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation

class Utility: NSObject {
    
    /// This method will check your internet connection
    ///
    /// - Returns: true/false
    class func isInternetAvailable() -> Bool {
        
        let reachability: Reachability = Reachability.forInternetConnection()
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        
        if networkStatus == 0 {
            return false
        } else {
            return true
        }
    }
}
