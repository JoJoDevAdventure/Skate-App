//
//  SettingCustomCell.swift
//  Skate App
//
//  Created by Youssef Bhl on 14/03/2022.
//

import UIKit

class SettingCustomCell: UITableViewCell {
    
    static let identifier = "SettingCustomCell"

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var systemImage: UIImageView!
    
    func configure(_ title : String, _ imageName : String) {
        self.title.text = title
        self.systemImage.image = UIImage(systemName: imageName)
    }
}
