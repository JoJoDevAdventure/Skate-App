//
//  ProfilePicImageView.swift
//  Skate App
//
//  Created by Youssef Bhl on 09/03/2022.
//

import UIKit

class ProfilePicImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let height = frame.height
        layer.cornerRadius = height / 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.3
        layer.borderColor = UIColor.init(red: 145/255, green: 75/255, blue: 97/255, alpha: 1).cgColor
        layer.borderWidth = 3
    }

}
