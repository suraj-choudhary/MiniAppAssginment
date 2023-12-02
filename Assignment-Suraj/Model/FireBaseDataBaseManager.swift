//
//  FireBaseDataBaseManager.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 02/12/23.
//
import Firebase
import Foundation
import FirebaseDatabase

/// Manae the firebase data base
final class FireBaseDataBaseManager {
    static let shared = FireBaseDataBaseManager()
    let userID = Auth.auth().currentUser?.uid
    private init() {}
    
    func createReference(token: String, model: PostModel) {
        
        let rootRefrence = Database.database().reference()
        rootRefrence.child("users")
            .child("\(token)")
            .setValue(["imageUrls": model.imageUrls,
                       "postCreationDate": model.postCreationDate,
                       "userId": model.userId,
                       "postDescription": model.postDescription
                      ])
        
        rootRefrence.child("users").child("\(token)").observeSingleEvent(of: .value) { (data) in
            
            print(data)
        }
    }
}
