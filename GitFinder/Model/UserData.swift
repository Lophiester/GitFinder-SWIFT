//
//  UserData.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/18.
//

import Foundation

struct UserData: Codable{
    let login : String
    let name : String
    let avatarUrl : String?
    let bio : String?
    let url : String
    let followersUrl : String
    let  createdAt : String
    let updatedAt : String
    
    
}

struct Follower : Codable {
    let login: String
    let avatarUrl: String
}

struct MockData{
    
    static let userData = sampleUserData
    static let sampleUserData = UserData(login: "Username", name: "Ronald McDonalds", avatarUrl: "image", bio: "This is where the github bio will go.", url: "url_link", followersUrl: "url_link", createdAt: "data", updatedAt: "data")
}
