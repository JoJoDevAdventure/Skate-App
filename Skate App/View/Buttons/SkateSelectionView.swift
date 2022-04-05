//
//  SkateSelectionView.swift
//  Skate App
//
//  Created by Youssef Bhl on 24/02/2022.
//

import UIKit

class SkateSelectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let height = self.frame.height
        self.layer.cornerRadius = height/2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.3
        self.layer.borderColor = UIColor.init(red: 145/255, green: 75/255, blue: 97/255, alpha: 1).cgColor
        self.layer.borderWidth = 3
    }
    
}
