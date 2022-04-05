//
//  ViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 20/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: RoundedTextfield!
    @IBOutlet weak var passwrdTF: RoundedTextfield!
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    
    private let loggedInIdentifier = "loggedIn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        actions()
    }
    
    //------------------- UI ----------------------//
    
    func setupUI() {
        setupPlaceholder()
    }
    
    // TextFields setup
    func setupPlaceholder() {
        emailTF.attributedPlaceholder = NSAttributedString(
            string: "e-mail / Username",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwrdTF.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    
    //------------------- Actions ----------------------//
    
    func actions() {
        resignKeyboard()
        TFSetup()
    }
    
    func resignKeyboard() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        emailTF.resignFirstResponder()
        passwrdTF.resignFirstResponder()
    }
    
    @IBAction func pressedLogIn(_ sender: Any) {
        loginUser()
    }
    
    //Login User
    func loginUser() {
        guard emailTF.text != "" else {
            AlertHelper.shared.missingInfoAlert(self)
            return
        }
        let email = emailTF.text!
        
        guard passwrdTF.text != "" else {
            AlertHelper.shared.missingInfoAlert(self)
            return
        }
        let password = passwrdTF.text!
        AuthManager.shared.logInUser(email: email, password: password) { success, error in
            if success {
                //logged in
                print("LoggedIn")
                self.performSegue(withIdentifier: self.loggedInIdentifier, sender: self)
            } else {
                let errorType = error!.localizedDescription
                self.exceptions(errorType)
            }
        }
    }
    
    private func exceptions(_ error: String) {
        
        passwordErrorLbl.isHidden = true
        emailErrorLbl.isHidden = true
        
        let passwordError = "The password is invalid or the user does not have a password."
        let invalidEmail = "The email address is badly formatted."
        let noUser = "There is no user record corresponding to this identifier. The user may have been deleted."
        
        if error == passwordError {
            //wrong password
            passwordErrorLbl.text = "Wrong password."
            passwordErrorLbl.isHidden = false
        } else if error == invalidEmail {
            //invalid email
            emailErrorLbl.text = "Invalid e-mail adress."
            emailErrorLbl.isHidden = false
        } else if error == noUser {
            //no existant account
            emailErrorLbl.text = "Account not found"
            emailErrorLbl.isHidden = false
        }

    }

}

//------------------- Extension ----------------------//

//TextField
extension LoginViewController: UITextFieldDelegate {
    
    func TFSetup() {
        emailTF.delegate = self
        passwrdTF.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
