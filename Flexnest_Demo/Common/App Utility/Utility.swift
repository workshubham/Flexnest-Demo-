//
//  Utility.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit
import Windless

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
    
    /// Showing no internet view
    class func showNoInternetView() {
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            NoInternetView.shared.settingInternetView(title: "No Internet Connection", color: UIColor.red)
            UIView.animate(withDuration: 0.2) {
                keyWindow.addSubview(NoInternetView.shared)
            }
        }
    }
    
    /// Removing no internet view
    class func removeNoInternetView() {
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            if NoInternetView.shared.isDescendant(of: keyWindow) {
                NoInternetView.shared.settingInternetView(title: "Connected", color: UIColor(red: 0.0/255.0, green: 143.0/255.0, blue: 0.0/255.0, alpha: 1.0))
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    NoInternetView.shared.removeFromSuperview()
                }
            }
        }
    }
    
    /// This method will set shimmer aimation on view
    ///
    /// - Parameters:
    ///   - animateView: pass animation View
    class func startShimmerAnimation(animateView: UIView) {
        
        animateView.windless
            .apply {
                $0.beginTime = 0.1
                $0.pauseDuration = 0.1
                $0.duration = 0.5//1
                $0.direction = .right
                $0.speed = 0.5
                $0.animationLayerColor = .lightGray
                $0.animationBackgroundColor = .systemGroupedBackground
            }
            .start()
    }
    
    /// This method will end shimmer aimation on view
    ///
    /// - Parameter animateView: - animateView: pass animation View
    class func stopShimmerAnimation(animateView: UIView) {
        animateView.windless.end()
    }
}
