//
//  Response.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 08.10.2021.
//

import Foundation

class Response<T: Decodable>: Decodable {
    let response: Items<T>
}

class Items<T: Decodable>: Decodable {
    let items: [T]
}
