//
//  PhotoModel.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 16.08.2021.
//

import Foundation

struct PhotoModel {
    let photoName: String
    var likeCount: Int
    var isLike: Bool {
        didSet {
            likeCount += isLike ? 1 : -1
        }
    }
}
