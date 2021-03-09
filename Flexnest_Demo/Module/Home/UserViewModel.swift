//
//  UserViewModel.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import Foundation

struct UserViewModel {
    
    let name: String
    let email: String
    let avatar: String
    
    init(data: UserData) {
        
        self.name = "\(data.firstName) \(data.lastName)"
        self.email = data.email
        self.avatar = data.avatar
    }
}
