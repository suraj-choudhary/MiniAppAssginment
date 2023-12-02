//
//  FirebaseManager.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 30/11/23.
//

import Foundation
import FirebaseAuth
class FirebaseManager {
    static let shared = FirebaseManager()
    private let auth = Auth.auth()
    private var verificationID: String?
    private init() {}
    
    public func authWithPhone(phoneNumber: String, completion: @escaping(Bool, String) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { id, error in
            self.auth.languageCode = "en"
            guard let verificationID = id, error == nil else {
                completion(false, "")
                return
            }
            self.verificationID = verificationID
            completion(true, verificationID)
            
        }
    }
    
    public func verifyCode(smsCode: String, completion: @escaping(Bool) -> Void) {
        guard let verificationID = verificationID else {
            completion(false)
            return
        }
        let credetial = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: smsCode)
        
        auth.signIn(with: credetial) { res,error in
            
            guard let res = res, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
