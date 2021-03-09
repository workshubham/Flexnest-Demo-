//
//  HomeWebService.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation

class HomeWebService {
    
    static let shared = HomeWebService()
    private init() {}
    
    /// Fetching users details
    /// - Parameters:
    ///   - url: Url for users details
    ///   - onCompletion: Mapping it to data
    func fetchUsersDetails(url: URL, onCompletion: @escaping (HomeModel?,String?,Error?) -> Void) {
        
        AlamoRequestManager.shared.requestDataFor(url, methodType: .get, params: nil) { (response) in
            
            if let response = response {
                DispatchQueue.global(qos: .background).async {
                    
                    UserDefaultsManager.saveUserData(dataManager: response)
                    guard let data = HomeModel(data: response) else {
                        onCompletion(nil,"Something Went wrong", nil)
                        return
                    }
                    DispatchQueue.main.async {
                        onCompletion(data,nil,nil)
                    }
                }
            }
        } onError: { (error) in
            
            DispatchQueue.main.async {
                onCompletion(nil, nil, error!)
            }
        }

    }
}
