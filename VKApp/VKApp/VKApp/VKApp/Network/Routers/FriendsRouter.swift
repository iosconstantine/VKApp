//
//  FriendsRouter.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 19.10.2021.
//

import Foundation
import Alamofire

enum FriendsRouter: URLRequestConvertible {
    case getFriends(id: Int)
    
    private var baseURL: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getFriends: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getFriends(_ ): return "/friends.get"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getFriends(let id): return [
            "user_id": String(id),
             "order": "name",
             "fields": "sex, bdate, city, country, photo_100, photo_200_orig",
            "access_token": Session.shared.token,
             "v": String(Session.shared.versionApi)]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
