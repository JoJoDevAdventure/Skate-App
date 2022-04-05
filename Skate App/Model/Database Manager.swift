//
//  Database Manager.swift
//  Skate App
//
//  Created by Youssef Bhl on 27/02/2022.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    public func canCreatUser(email: String, username: String, completion: (Bool)->Void) {
        //check in all usernames if it exists
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child("Users").child(username).setValue(["email" : email]) {error, _ in
            if error == nil {
                completion(true)
                return
            } else {
                completion (false)
                return
            }
        }
    }

}
