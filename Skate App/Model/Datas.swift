//
//  Datas.swift
//  Skate App
//
//  Created by Youssef Bhl on 09/03/2022.
//

import Foundation
import CoreData

class Datas {
    
    static let shared = Datas()
    
    var testPosts : [UserPost] {
        return [
            UserPost(username: "Youssef", profileImgName: "img1", postImgName: "post1", numberOfLikes: 13),
            UserPost(username: "Youssef", profileImgName: "img1", postImgName: "post2", numberOfLikes: 245),
            UserPost(username: "Youssef", profileImgName: "img1", postImgName: "post3", numberOfLikes: 43),
            UserPost(username: "Youssef", profileImgName: "img1", postImgName: "post4", numberOfLikes: 55),
            UserPost(username: "Youssef", profileImgName: "img1", postImgName: "post5", numberOfLikes: 35),
        ]
    }
}

