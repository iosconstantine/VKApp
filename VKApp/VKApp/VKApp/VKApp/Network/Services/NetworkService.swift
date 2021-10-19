//
//  NetworkService.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 25.09.2021.
//

import Foundation
import UIKit

class NetworkServise {
    
    var urlConstructor = URLComponents() // создаем конструктор для URL
    let session: URLSession
    
    init(){
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    //MARK: - GET FRIENDS
    func getFriends(userId: Int,
                    successCompletion: @escaping ([Friends]) -> Void,
                    errorCompletion: @escaping () -> Void) {
        // путь
        urlConstructor.path = "/method/friends.get"
        
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(userId)),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "sex, bdate, city, country, photo_100, photo_200_orig"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: String(Session.shared.versionApi))
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                errorCompletion()
                return
            }
            guard let data = data else {
                errorCompletion()
                return
            }
           
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data).response.items
                successCompletion(friends)
            } catch {
                print("Ошибка декодирования")
                print(error)
                errorCompletion()
            }
            
        }
        // запускаем задачу
        task.resume()
    }
    //MARK: - GET PHOTOS
    func getPhotos(ownerId: Int) {
        urlConstructor.path = "/method/photos.getAll"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: String(ownerId)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "photo_sizes", value: "1"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: String(Session.shared.versionApi))
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            //let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
           
        }
        // запускаем задачу
        task.resume()
    }
    
    //MARK: - GET GROUPS
    func getGroups(){
        urlConstructor.path = "/method/groups.get"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "description"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: String(Session.shared.versionApi))
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            //let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            
        }
        // запускаем задачу
        task.resume()
    }
    //MARK: - GET SEARCH GROUPS
    func getSearchGroups(text: String) {
        urlConstructor.path = "/method/groups.search"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: text),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: String(Session.shared.versionApi))
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            //let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            
        }
        // запускаем задачу
        task.resume()
    }
}
