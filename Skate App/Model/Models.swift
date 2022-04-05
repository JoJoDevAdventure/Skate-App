//
//  Models.swift
//  Skate App
//
//  Created by Youssef Bhl on 28/02/2022.
//

import Foundation
import UIKit



enum SkateType {
    case classic
    case penny
    case longboard
    case none
}

enum Gender {
    case male
    case female
}

struct UserPost {
    var username: String
    var profileImgName: String
    var postImgName: String
    var numberOfLikes: Int
}
