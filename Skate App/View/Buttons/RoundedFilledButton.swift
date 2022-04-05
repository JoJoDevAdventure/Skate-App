//
//  RoundedFilledButton.swift
//  Skate App
//
//  Created by Youssef Bhl on 21/02/2022.
//

import UIKit

class RoundedFilledButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        let height = self.frame.height
        self.layer.cornerRadius = height/2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 6
    }
}
