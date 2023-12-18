//
//  UserData.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/18.
//

import Foundation

struct UserData: Codable{
    let login : String
    let avatarUrl : String?
    let bio : String?
}

struct MockData{
    
    static let userData = sampleUserData
    static let sampleUserData = UserData(login: "Username", avatarUrl: "image", bio: "This is where the github bio will go.")
}
