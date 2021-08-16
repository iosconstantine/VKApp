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
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "8")]),
            
            FriendModel(name: "Абрамов Кирилл Тимофеевич", avatarName: "avatarM1", images: [
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "7")]),
            
            FriendModel(name: "Баженова Антонина Андреевна", avatarName: "avatarW1", images: [
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "1")]),
            
            FriendModel(name: "Воронов Богдан Денисович", avatarName: "avatarM2", images: [
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "6")]),
            
            FriendModel(name: "Дунаев Ярослав Александрович", avatarName: "avatarM3", images: [
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "1")]),
            
            FriendModel(name: "Топорова Мария Сергеевна", avatarName: "avatarW2", images: [
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "8")]),
            
            FriendModel(name: "Ульянова Светлана Елисеевна", avatarName: "avatarW3", images: [
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "1")]),
            
            FriendModel(name: "Калинин Михаил Антонович", avatarName: "avatarM5", images: [
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "8")]),
            
            FriendModel(name: "Филатова Виктория Тимуровна", avatarName: "avatarW4", images: [
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "3"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "6")]),
            
            FriendModel(name: "Чижова Милана Тимуровна", avatarName: "avatarW5", images: [
                            PhotoModel(photoName: "5"),
                            PhotoModel(photoName: "4"),
                            PhotoModel(photoName: "6"),
                            PhotoModel(photoName: "7"),
                            PhotoModel(photoName: "8"),
                            PhotoModel(photoName: "1"),
                            PhotoModel(photoName: "2"),
                            PhotoModel(photoName: "3")])
            
        ]
    }
}
