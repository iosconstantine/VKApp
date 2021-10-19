//
//  PhotosRouter.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 19.10.2021.
//

import Foundation
import Alamofire

enum PhotosRouter: URLRequestConvertible {
    case getPhotos(id: Int)
    
    private var baseURL: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getPhotos: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getPhotos: return "/photos.getAll"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getPhotos(let id): return [
            "owner_id": String(id),
            "extended": "1",
            "photo_sizes": "1",
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
