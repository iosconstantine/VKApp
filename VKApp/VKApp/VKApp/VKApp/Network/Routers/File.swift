//
//  File.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 19.10.2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case get([String: String]), post([String: String])
    
    var baseURL: URL {
        return URL(string: "https://httpbin.org")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        }
    }
    
    var path: String {
        switch self {
        case .get: return "get"
        case .post: return "post"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case let .get(parameters):
            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        case let .post(parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}
