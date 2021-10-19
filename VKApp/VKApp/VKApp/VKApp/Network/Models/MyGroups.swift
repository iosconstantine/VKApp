//
//  MyGroups.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 19.10.2021.
//

import Foundation

class MyGroups: Decodable {
    var id: Int = 0
    var name: String = ""
    var photo: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.photo = try values.decode(String.self, forKey: .photo)
    }
    
}
