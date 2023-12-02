//
//  Service.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 30/11/23.
//

import Foundation

protocol ServiceProtocol: AnyObject {
    func loginWithPhoneNumber(phone: String, completion: @escaping(Bool, String?) -> Void)
}

class ServiceManager: ServiceProtocol {
    
    func loginWithPhoneNumber(phone: String, completion: @escaping (Bool, String?) -> Void) {
        FirebaseManager.shared.authWithPhone(phoneNumber: phone) { sucess, res in
            switch sucess {
            case true:
                completion(sucess, res)
            case false:
                completion(sucess, nil)
            }
        }
    }
}
