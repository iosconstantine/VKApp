//
//  FriendsModel.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 29.09.2021.
//

import Foundation

struct FriendsModel: Decodable {
    let response: ResponceFriends
}

struct ResponceFriends: Decodable {
    let items: [Friends]
}

struct Friends: Decodable {
    let firstName: String 
    let id: Int
    let lastName: String
    let photo: String
    
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case photo = "photo_200_orig"
    }
}
