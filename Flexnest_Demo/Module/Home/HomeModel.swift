//
//  HomeModel.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation

struct HomeModel {
    
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var usersData: [UserData] = [UserData]()
    
    init?(data: [String: Any]) {
        
        self.page = data["page"] as? Int ?? -1
        self.perPage = data["per_page"] as? Int ?? -1
        self.total = data["total"] as? Int ?? -1
        self.totalPages = data["total_pages"] as? Int ?? -1
        if let data = data["data"] as? [[String: Any]] {
            for datum in data {
                self.usersData.append(UserData(data: datum))
            }
        }
    }
}

struct UserData {
    
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    init(data: [String: Any]) {
        
        self.id = data["id"] as? Int ?? -1
        self.email = data["email"] as? String ?? ""
        self.firstName = data["first_name"] as? String ?? ""
        self.lastName = data["last_name"] as? String ?? ""
        self.avatar = data["avatar"] as? String ?? ""
    }
}
