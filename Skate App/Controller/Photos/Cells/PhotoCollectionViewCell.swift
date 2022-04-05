//
//  PhotoCollectionViewCell.swift
//  Skate App
//
//  Created by Youssef Bhl on 13/03/2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    
    static let identifier = "PhotoCollectionViewCell"
    
    func configure(_ imageName : String) {
        self.imageV.image = UIImage(named: imageName)
    }
    
}
