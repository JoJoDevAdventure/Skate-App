//
//  Enum.swift
//  Skate App
//
//  Created by Youssef Bhl on 25/02/2022.
//

import Foundation

enum pickingMod {
    case library
    case camera
}

extension String {
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}

class StringFormaters {
    
    static let shared = StringFormaters()
    
    public func formatNumberOfLikes(_ nbLikes : Int) -> String {
        return "\(nbLikes)" + " " + "likes."
    }
    
}
