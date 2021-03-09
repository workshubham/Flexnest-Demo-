//
//  UserDefaultsManager.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation

struct Key {
    static let userCollectionData = "userCollectionData"
}

struct UserDefaultsManager {
    
    static func saveUserData(dataManager: [String: Any]) {
        
        var oldLocalData = UserDefaultsManager.getUserData()
        if !oldLocalData.isEmpty {
            
            if var oldUserData = oldLocalData["data"] as? [[String: Any]] {
                if let newData = dataManager["data"] as? [[String: Any]] {
                    for data in newData {
                        oldUserData.append(data)
                    }
                    oldLocalData["data"] = oldUserData
                    UserDefaults.standard.removeObject(forKey: Key.userCollectionData)
                    UserDefaults.standard.setValue(oldLocalData, forKey: Key.userCollectionData)
                }
            }
            
        } else {
            UserDefaults.standard.setValue(dataManager, forKey: Key.userCollectionData)
        }
    }
    
    static func getUserData() -> [String: Any] {
        
        if let dataManager = UserDefaults.standard.object(forKey: Key.userCollectionData) as? [String: Any] {
            return dataManager
        }
        return [String: Any]()
    }
}
