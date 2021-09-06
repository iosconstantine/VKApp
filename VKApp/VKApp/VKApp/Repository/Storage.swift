//
//  Storage.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 06.09.2021.
//

import Foundation

class Storage {
    static var allUsers = FriendsStorage.init().friends
    static var allGroups = GroupStorage.init().allGroups

    static var userIdActiveSession = 0
}
