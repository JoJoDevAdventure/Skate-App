//
//  RoundedTextfield.swift
//  Skate App
//
//  Created by Youssef Bhl on 21/02/2022.
//

import UIKit

class RoundedTextfield: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 10
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor 
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.2
    }

}
