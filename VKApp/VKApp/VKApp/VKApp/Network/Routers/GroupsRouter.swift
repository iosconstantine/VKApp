//
//  GroupsRouter.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 19.10.2021.
//

import Foundation
import Alamofire

enum GroupsRouter: URLRequestConvertible {
    case getGroups
    case searchGroups(name: String)
    case joinGroup(id: Int)
    case leaveGroup(id: Int)
    
    private var baseURL: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getGroups: return .get
        case .searchGroups: return .get
        case .joinGroup: return .get
        case .leaveGroup: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getGroups: return "/groups.get"
        case .searchGroups: return "/groups.search"
        case .joinGroup: return "/groups.join"
        case .leaveGroup: return "/groups.leave"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getGroups: return [
            "extended": "1",
            "fields": "description",
            "access_token": Session.shared.token,
             "v": String(Session.shared.versionApi)]
        case .searchGroups(let name): return [
            "q" : name,
            "access_token": Session.shared.token,
             "v": String(Session.shared.versionApi)]
        case .joinGroup(let id): return [
            "group_id" : id,
            "access_token": Session.shared.token,
             "v": String(Session.shared.versionApi)]
        case .leaveGroup(let id): return [
            "group_id" : id,
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
