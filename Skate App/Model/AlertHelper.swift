//
//  AlertHelper.swift
//  Skate App
//
//  Created by Youssef Bhl on 25/02/2022.
//

import Foundation
import UIKit
import PhotosUI

class AlertHelper {
    
    static let shared = AlertHelper()
    
    //passwords don't match alert (SignUp)
    func missingInfoAlert(_ viewController : UIViewController) {
        let alert = UIAlertController(title: "Missing Informations.", message: "Fill all needed informations to continue.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(ok)
        viewController.present(alert, animated: true)
    }
    
    //show Alert to pick photo
    func picPictureAlert(_ viewController : UIViewController,_ of: String, completion : (@escaping(pickingMod)->Void)) {
        //check if camera isEnabled
        let hasCam = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        //alert setup
        let alert = UIAlertController(title: "Select a photo", message: "Select a picture of \(of) !", preferredStyle: .actionSheet)
        let selectFromLibrary = UIAlertAction(title: "Select from Library", style: .default) { action in
            //show a picker from library
            completion(.library)
        }
        alert.addAction(selectFromLibrary)
        let pickFromCamera = UIAlertAction(title: "Pick from CameraRoll", style: .default) { action in
            //show cameraRoll picker
            completion(.camera)
        }
        if hasCam {
            alert.addAction(pickFromCamera)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        viewController.present(alert, animated: true)
    }
    
}
