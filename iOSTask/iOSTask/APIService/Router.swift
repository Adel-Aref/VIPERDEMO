//
//  Router.swift
//  FakeStoreDemo
//
//  Created by Adel Aref on 27/02/2024.
//

import Foundation

enum Router: Equatable {
    case fetchPostsList(page: Int, pageSize: Int)
    case fetchPost(id: Int)
    
    var url: String {scheme + "://" + host + path}
    var scheme: String {API.scheme}
    var host: String {API.URL}
    
    var path: String {
        switch self {
        case .fetchPostsList:
            return "posts"
        case .fetchPost(let id) :
            return "posts/\(id)"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .fetchPostsList(let page, let pageSize):
            return [
                URLQueryItem(name: "_page", value: "\(page)"),
                URLQueryItem(name: "_limit", value: "\(pageSize)")
            ]
        default:
            return []
        }
    }
    
    /// Description
    var method: String {
        switch self {
        case .fetchPostsList , .fetchPost:
            return "GET"
        }
    }
    
}

struct API {
    static var publicKey: String { "Enter your PUBLIC KEY" }
    static var privateKey: String { "Enter your PRIVATE KEY" }
    static var timeStamp: String { formatter.string(from: Date()) }
    static var schemeURL: String {scheme + "://" + URL}
    static var scheme: String {
        return PlistEnvironment.scheme
    }
    static var URL: String {
        PlistEnvironment.baseURL
    }
    
    private static let formatter: DateFormatter = {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMddHHmmss"
        return form
    }()
}
