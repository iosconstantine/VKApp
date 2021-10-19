//
//  GroupStorage.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import Foundation

class GroupStorage {
    var groups: [GroupModel]
    let allGroups: [GroupModel]
    
    init() {
        groups = [GroupModel(nameGroup: "Swift", avatarName: "logo-swift")]
        allGroups = [GroupModel(nameGroup: "Sketch", avatarName: "019-sketch"),
                     GroupModel(nameGroup: "MCdonalds", avatarName: "046-mcdonalds"),
                     GroupModel(nameGroup: "Paypal", avatarName: "028-paypal"),
                     GroupModel(nameGroup: "Microsoft", avatarName: "logo-microsoft"),
                     GroupModel(nameGroup: "Nike", avatarName: "034-nike"),
                     GroupModel(nameGroup: "Swift", avatarName: "logo-swift"),
                     GroupModel(nameGroup: "uTorrent", avatarName: "008-utorrent"),
                     GroupModel(nameGroup: "Wechat", avatarName: "005-wechat"),
                     GroupModel(nameGroup: "Tinder", avatarName: "012-tinder")]
    }
}
