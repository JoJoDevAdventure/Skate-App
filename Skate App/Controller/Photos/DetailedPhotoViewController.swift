//
//  DetailedPhotoViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 14/03/2022.
//

import UIKit

class DetailedPhotoViewController: UIViewController {
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var profilePhotoIV: UIImageView!
    @IBOutlet weak var photoIV: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    
    var post : UserPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard post != nil else { return }
        configure(post!)
    }
    
    func configure(_ userPost : UserPost) {
        self.nicknameLabel.text = userPost.username
        self.profilePhotoIV.image = UIImage(named: userPost.profileImgName)
        self.photoIV.image = UIImage(named: userPost.postImgName)
        self.usernameLabel.text = userPost.username
        self.numberOfLikesLabel.text = StringFormaters.shared.formatNumberOfLikes(userPost.numberOfLikes)
        //image setup
        let imageHeight = UIImageView.init(image: UIImage(named: userPost.postImgName)).frame.height
        self.photoIV.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: imageHeight)
        
    }
}
