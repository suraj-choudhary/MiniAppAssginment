//
//  UserRegistrationModel.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 30/11/23.
//

import Foundation
struct UserRegistrationModel {
    var phone: String
    var password: String
    init(phone: String, password: String) {
        self.phone = phone
        self.password = password
    }
}
