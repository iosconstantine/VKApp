//
//  Users.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 08.10.2021.
//

import Foundation

class Users: Decodable {
    var firstName: String = ""
    var id: Int = 0
    var lastName: String = ""
    var avatarURL: String = ""
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case avatarURL = "photo_200_orig"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.avatarURL = try values.decode(String.self, forKey: .avatarURL)
    }
}

