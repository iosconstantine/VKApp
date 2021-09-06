//
//  FriendsStorage.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import Foundation

class FriendsStorage {
    var friends: [FriendModel]
    
    
    init() {
        friends = [
            FriendModel(name: "Тищенко Константин Тимурович", avatarName: "avatarM4", images: [
                            PhotoModel(photoName: "1", likeCount: 1, isLike: true),
                            PhotoModel(photoName: "2", likeCount: 3, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 5, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 7, isLike: true),
                            PhotoModel(photoName: "5", likeCount: 12, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 33, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 92, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 4, isLike: false)]),
            
            FriendModel(name: "Абрамов Кирилл Тимофеевич", avatarName: "avatarM1", images: [
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Баженова Антонина Андреевна", avatarName: "avatarW1", images: [
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Воронов Богдан Денисович", avatarName: "avatarM2", images: [
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Дунаев Ярослав Александрович", avatarName: "avatarM3", images: [
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Топорова Мария Сергеевна", avatarName: "avatarW2", images: [
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Ульянова Светлана Елисеевна", avatarName: "avatarW3", images: [
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Калинин Михаил Антонович", avatarName: "avatarM5", images: [
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Филатова Виктория Тимуровна", avatarName: "avatarW4", images: [
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "3", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "2", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "1", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "8", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "7", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "6", likeCount: 0, isLike: false)]),
            
            FriendModel(name: "Чижова Милана Тимуровна", avatarName: "avatarW5", images: [
                            PhotoModel(photoName: "5", likeCount: 0, isLike: false),
                            PhotoModel(photoName: "4", likeCount: 0, isLike: false),
                            ])
            
        ]
        
    }
    
    static func getIndexByUsername(username: String) -> Int!  {
        Storage.allUsers.firstIndex(where: { $0.name == username }) // получаем индекс имени, которое придет из username
    }

    static func getPhotosForUsername(username: String) -> [PhotoModel]{
        var tempPhoto: [PhotoModel]
        tempPhoto = Storage.allUsers[getIndexByUsername(username: username) ?? 0].images // получим все фотографии по индексу имени, которое к нам пришло выше
        return tempPhoto
    }
}

class Storage {
    static var allUsers = FriendsStorage.init().friends
}
