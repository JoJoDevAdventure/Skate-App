//
//  PostsTableViewCell.swift
//  Skate App
//
//  Created by Youssef Bhl on 09/03/2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var post: UIImageView!
    @IBOutlet weak var nbOfLikes: UILabel!
    
    static let identifier = "PostsTableViewCell"
    
    func configure(_ post : UserPost) {
        self.profileImg.image = UIImage(named: post.profileImgName)
        self.username.text = post.username
        self.post.image = UIImage(named: post.postImgName)
        self.nbOfLikes.text = "\(post.numberOfLikes) Likes!"
    }
    
}
