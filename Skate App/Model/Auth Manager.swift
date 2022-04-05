//
//  Auth Manager.swift
//  Skate App
//
//  Created by Youssef Bhl on 27/02/2022.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    public func registerNewUser(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { created, error in
            if created != nil {
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
        
    }
    
    public func logInUser(email: String, password: String, completion: @escaping (Bool, Error?)->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { loggedIn , error in
            guard loggedIn != nil, error == nil else {
                //failed to logIn
                completion(false, error)
                return
            }
            completion(true, error)
        }
    }
    
    public func verifyIfLoggedIn(completion: @escaping (Bool)->Void) {
        if Auth.auth().currentUser != nil {
            ///there is a user logged In
            completion(true)
        }
        completion(false)
    }
    
    public func logOut(completion: (Bool)->Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
    
}
