//
//  SignUpViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 24/02/2022.
//

import UIKit
import CoreData
import Foundation

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTF: RoundedTextfield!
    @IBOutlet weak var passwrdTF: RoundedTextfield!
    @IBOutlet weak var confirmPwTF: RoundedTextfield!
    @IBOutlet var Skates: [SkateSelectionView]!
    @IBOutlet weak var passwordNoMatch: UILabel!
    @IBOutlet weak var emailErrorLBL: UILabel!
    @IBOutlet weak var passwordErrorLBL: UILabel!
    @IBOutlet weak var skateErrorLBL: UILabel!
    
    let registredSegIdentifier = "Registred"
    var isSelectedSkate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TFSetup()
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
            string: "e-mail",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwrdTF.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        confirmPwTF.attributedPlaceholder = NSAttributedString(
            string: "Confirm password",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    
    //------------------- Actions ----------------------//
    
    func actions() {
        resignKeyboard()
        selectedSkate()
    }
    
    //TF actions
    func resignKeyboard() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        emailTF.resignFirstResponder()
        passwrdTF.resignFirstResponder()
        confirmPwTF.resignFirstResponder()
    }

    //Skate selection
    func selectedSkate() {
        Skates.forEach { skate in
            switch skate.tag {
            case 0 : skate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectedFirst)))
            case 1 : skate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectedSecond)))
            case 2 : skate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectedLast)))
            default:
                return
            }
        }
    }
    
    @objc func selectedFirst() {
        Skates.forEach { skate in
            if skate.tag == 0 {
                skate.backgroundColor = UIColor.init(red: 173/255, green: 119/255, blue: 136/255, alpha: 1)
                isSelectedSkate = true
            } else {
                skate.backgroundColor = UIColor.white
            }
        }
    }
    
    @objc func selectedSecond() {
        Skates.forEach { skate in
            if skate.tag == 1 {
                skate.backgroundColor = UIColor.init(red: 173/255, green: 119/255, blue: 136/255, alpha: 1)
                isSelectedSkate = true
            } else {
                skate.backgroundColor = UIColor.white
            }
        }
    }
    
    @objc func selectedLast() {
        Skates.forEach { skate in
            if skate.tag == 2 {
                skate.backgroundColor = UIColor.init(red: 173/255, green: 119/255, blue: 136/255, alpha: 1)
                isSelectedSkate = true
            } else {
                skate.backgroundColor = UIColor.white
            }
        }
    }
    
    //Segment to more moredetails prepared
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard segue.identifier == segIdentifier else { return }
        //guard let _ = segue.destination as! MoreDetailViewController? else { return }
    }
    
    //SignUp actions
    
    func signUpVerifications(completion: (Bool) -> Void) {
        if emailTF.text == nil {
            AlertHelper.shared.missingInfoAlert(self)
            completion (false)
        } else if !emailTF.text!.contains("@") {
            emailErrorLBL.isHidden = false
            completion(false)
        } else if passwrdTF.text == nil {
            AlertHelper.shared.missingInfoAlert(self)
            completion (false)
        } else if passwrdTF.text!.count < 7 {
            passwordErrorLBL.text = "Password must be more than 8 char"
            passwordErrorLBL.isHidden = false
            completion(false)
        } else if confirmPwTF.text == nil {
            AlertHelper.shared.missingInfoAlert(self)
            completion (false)
        } else if confirmPwTF.text != passwrdTF.text {
            passwordErrorLBL.text = "Passwords doesn't match."
            passwordErrorLBL.isHidden = false
            completion (false)
        } else if !isSelectedSkate {
            skateErrorLBL.isHidden = false
            completion (false)
        } else {
            completion(true)
        }
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        
        //verify if passwords match :
        passwordErrorLBL.isHidden = true
        emailErrorLBL.isHidden = true
        skateErrorLBL.isHidden = true
        signUpVerifications { noError in
            let email = self.emailTF.text!
            let password = self.passwrdTF.text!
            if noError {
                    AuthManager.shared.registerNewUser(email: email, password: password) { registred, error in
                        self.performSegue(withIdentifier: self.registredSegIdentifier, sender: self)
                    
                

                }
            } else {
                return
            }
        }
    }
    
}

//------------------- Extension ----------------------//

//TextField
extension SignUpViewController: UITextFieldDelegate {
    
    func TFSetup() {
        emailTF.delegate = self
        passwrdTF.delegate = self
        confirmPwTF.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

