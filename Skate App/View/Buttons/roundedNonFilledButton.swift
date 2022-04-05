//
//  roundedNonFilledBtn.swift
//  Skate App
//
//  Created by Youssef Bhl on 10/03/2022.
//

import UIKit

class roundedNonFilledButton: UIButton {

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
        self.layer.cornerRadius = height/2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.init(red: 145/255, green: 75/255, blue: 97/255, alpha: 1).cgColor
    }
    
}
