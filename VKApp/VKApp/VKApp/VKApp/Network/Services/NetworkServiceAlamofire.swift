//
//  NetworkServiceAlamofire.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 26.09.2021.
//

import Foundation
import Alamofire

class NetworkServiceAlamofire {
    
    //MARK: - Friends methods
    func getFriends(userId: Int,
                    completion: @escaping (Result<[Users], NetworkServiceAlamofireError>) -> Void) {
        AF.request(FriendsRouter.getFriends(id: userId)).responseJSON { response in
            
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let friends = try JSONDecoder().decode(Response<Users>.self, from: data).response.items
                completion(.success(friends))
            } catch {
                completion(.failure(.decodeError))
                print(error)
            }
        }
    }
    //MARK: - Photos methods
    func getPhotos(ownerId: Int,
                   completion: @escaping (Result<[Photos], NetworkServiceAlamofireError>) -> Void) {
        AF.request(PhotosRouter.getPhotos(id: ownerId)).responseJSON { response in
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let photos = try JSONDecoder().decode(Response<Photos>.self, from: data).response.items
                completion(.success(photos))
            } catch {
                completion(.failure(.decodeError))
                print(error)
            }
        }
    }
    //MARK: - Groups methods
    func getGroups(completion: @escaping (Result<[MyGroups], NetworkServiceAlamofireError>) -> Void) {
        AF.request(GroupsRouter.getGroups).responseJSON { response in
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let groups = try JSONDecoder().decode(Response<MyGroups>.self, from: data).response.items
                completion(.success(groups))
            } catch {
                completion(.failure(.decodeError))
                print(error)
            }
        }
    }
    
    func searchGroups(name: String,
                      completion: @escaping (Result<[MyGroups], NetworkServiceAlamofireError>) -> Void) {
        AF.request(GroupsRouter.searchGroups(name: name)).responseJSON { response in
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let groups = try JSONDecoder().decode(Response<MyGroups>.self, from: data).response.items
                completion(.success(groups))
            } catch {
                completion(.failure(.decodeError))
                print(error)
            }
        }
    }
    
    func addGroup(id: Int,
                  completion: @escaping (Result<GroupActions, NetworkServiceAlamofireError>) -> Void) {
        AF.request(GroupsRouter.joinGroup(id: id)).responseJSON { response in
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let responseServer = try JSONDecoder().decode(GroupActions.self, from: data)
                completion(.success(responseServer))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
    
    func leaveGroup(id: Int,
                  completion: @escaping (Result<GroupActions, NetworkServiceAlamofireError>) -> Void) {
        AF.request(GroupsRouter.leaveGroup(id: id)).responseJSON { response in
            if let error = response.error {
                completion(.failure(.serverError))
                print(error)
            }
            
            guard let data = response.data else {
                completion(.failure(.notData))
                return
            }
            
            do {
                let responseServer = try JSONDecoder().decode(GroupActions.self, from: data)
                completion(.success(responseServer))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
    
    enum NetworkServiceAlamofireError: Error {
        case decodeError
        case notData
        case serverError
    }
}
