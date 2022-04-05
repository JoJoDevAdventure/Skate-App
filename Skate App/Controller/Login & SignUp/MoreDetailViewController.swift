//
//  MoreDetailViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 25/02/2022.
//

import Foundation
import UIKit
import PhotosUI
import CoreData


class MoreDetailViewController: UIViewController {
    
    @IBOutlet weak var profilePic: UIView!
    @IBOutlet weak var skatePic: UIView!
    @IBOutlet weak var nameTF: RoundedTextfield!
    @IBOutlet weak var lastNameTF: RoundedTextfield!
    @IBOutlet weak var nickNameTF: RoundedTextfield!
    @IBOutlet weak var bioTF: RoundedTextfield!
    @IBOutlet weak var cancelBtn: RoundedFilledButton!
    @IBOutlet weak var saveBtn: RoundedFilledButton!
    @IBOutlet weak var profilePicIV: UIImageView!
    @IBOutlet weak var skatePicIV: UIImageView!
    
    //User
    var currentUser : User?
    
    //Data collected
    var emailAdress : String!
    var password : String!
    var profilePicture : UIImage?
    var skatePicture : UIImage?
    var userName : String?
    var userLastName : String?
    var userNickname : String?
    var gender : Gender?
    var birthday : Date?
    var bio : String?
    
    //camera pickerSetup
    var profilePicker = UIImagePickerController()
    var skatePicker = UIImagePickerController()
    var profileLibraryPicker: PHPickerViewController?
    var skateLibraryPicker: PHPickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TFSetup()
        setupUI()
        actions()
    }
    
    //------------------- UI ----------------------//
    
    func setupUI() {
        setupView()
        setupPlaceholder()
        setupBtn()
    }
    
    // Image setup
    
    func setupView() {
        let height = profilePic.frame.height
        profilePic.layer.cornerRadius = height/2
        skatePic.layer.cornerRadius = 10
    }
    
    // TextFields setup
    func setupPlaceholder() {
        nameTF.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        lastNameTF.attributedPlaceholder = NSAttributedString(
            string: "Last name",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        nickNameTF.attributedPlaceholder = NSAttributedString(
            string: "Nick Name",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        bioTF.attributedPlaceholder = NSAttributedString(
            string: "Tell us more about you !",
            attributes : [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
    }
    
    // Button setup
    func setupBtn() {
        cancelBtn.layer.borderColor = UIColor.black.cgColor
        cancelBtn.layer.shadowOpacity = 0.5
    }
    
    //------------------- Actions ----------------------//
    
    func actions() {
        resignKeyboard()
        checkCamera()
        setupConfig()
        selectFunc()
    }
    
    //TF actions
    func resignKeyboard() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        nameTF.resignFirstResponder()
        lastNameTF.resignFirstResponder()
        nickNameTF.resignFirstResponder()
        bioTF.resignFirstResponder()
    }
    
    //Library
    func setupConfig() {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        config.preferredAssetRepresentationMode = .automatic
        profileLibraryPicker = PHPickerViewController(configuration: config)
        profileLibraryPicker!.delegate = self
        skateLibraryPicker = PHPickerViewController(configuration: config)
        skateLibraryPicker!.delegate = self
    }
    
    //Camera
    func checkCamera() {
        let hasCam = UIImagePickerController.isSourceTypeAvailable(.camera)
        if hasCam {
            setupPickers()
        }
    }
    
    func setupPickers() {
        profilePicker.sourceType = .camera
        profilePicker.delegate = self
        profilePicker.allowsEditing = false
        skatePicker.sourceType = .camera
        skatePicker.delegate = self
        skatePicker.allowsEditing = false
    }
    
    //chose profile and skate pic
    func selectFunc() {
        profilePic.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showAlertToPickProfilePic)))
        skatePic.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showAlertToPickSkate)))
    }
    
    @objc func showAlertToPickSkate() {
        AlertHelper.shared.picPictureAlert(self, "your Skate") { pickingMod in
            if pickingMod == .library {
                //present library picker
                print("library presentation")
                self.present(self.skateLibraryPicker!, animated: true, completion: nil)
            } else if pickingMod == .camera {
                //present camera picker
                print("camera")
                
            }
        }
    }
    
    @objc func showAlertToPickProfilePic() {
        AlertHelper.shared.picPictureAlert(self, "your Skate") { pickingMod in
            if pickingMod == .library {
                //present library picker
                print("library presentation")
                self.present(self.profileLibraryPicker!, animated: true, completion: nil)
            } else if pickingMod == .camera {
                //present camera picker
                print("camera")
                
            }
        }
    }
    
    //Cancel button pressed
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Save button pressed
    @IBAction func saveBtnPressed(_ sender: Any) {
        
    }
    
}

//------------------- Extension ----------------------//
//TextField
extension MoreDetailViewController: UITextFieldDelegate {
    
    func TFSetup() {
        nameTF.delegate = self
        lastNameTF.delegate = self
        nickNameTF.delegate = self
        bioTF.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension MoreDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == skatePicker {
            if let image = info[.originalImage] as? UIImage {
                self.skatePicIV.image = image
            }
        }
        if picker == profilePicker {
            if let image = info[.originalImage] as? UIImage {
                self.profilePicIV.image = image
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension MoreDetailViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if picker == profileLibraryPicker {
            picker.dismiss(animated: true, completion: nil)
            if let r = results.first {
                let item = r.itemProvider
                if item.canLoadObject(ofClass: UIImage.self) {
                    item.loadObject(ofClass: UIImage.self) { image, error in
                        DispatchQueue.main.async {
                            if let newImage = image as? UIImage {
                                self.profilePicIV.image = newImage
                            }
                            print(error?.localizedDescription as Any)
                        }
                    }
                }
            }
        } else if picker == skateLibraryPicker {
            picker.dismiss(animated: true, completion: nil)
            if let r = results.first {
                let item = r.itemProvider
                if item.canLoadObject(ofClass: UIImage.self) {
                    item.loadObject(ofClass: UIImage.self) { image, error in
                        DispatchQueue.main.async {
                            if let newImage = image as? UIImage {
                                self.skatePicIV.image = newImage
                            }
                            print(error?.localizedDescription as Any)
                        }
                    }
                }
            }
        }
    }
}


