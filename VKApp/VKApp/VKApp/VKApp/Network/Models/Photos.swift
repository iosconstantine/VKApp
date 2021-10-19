//
//  Photos.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 16.10.2021.
//

import Foundation

class Photos: Decodable {
    var id: Int = 0
    var ownerId: Int = 0
    var url: String = ""
    var count: Int = 0
    var arrayOfUrl = [String]()
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case sizes
        case likes
    }
    
    enum SizeKeys: String, CodingKey {
        case url
    }
    
    enum LikesKeys: String, CodingKey {
        case count
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.ownerId = try values.decode(Int.self, forKey: .ownerId)
        
        var sizeValues = try values.nestedUnkeyedContainer(forKey: .sizes)
        while !sizeValues.isAtEnd {
            let firstSizeValues = try sizeValues.nestedContainer(keyedBy: SizeKeys.self)
            arrayOfUrl.append(try firstSizeValues.decode(String.self, forKey: .url))
        }
        
        url = arrayOfUrl[arrayOfUrl.endIndex-2]
        
        let likeValues = try values.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
        self.count = try likeValues.decode(Int.self, forKey: .count)
        
    }
}

