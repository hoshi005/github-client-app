//
//  APIRequestType.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

protocol APIRequestType {
    
    associatedtype Response: Codable
    
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}


// MARK: - デフォルト実装.

extension APIRequestType {
    var scheme: String { "https" }
    var host: String { "api.github.com" }
    var queryItems: [URLQueryItem]? { nil }
}


// MARK: - 各種関数.

extension APIRequestType {
    
    var url: URLComponents {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        print(components.url?.absoluteURL ?? "no data")
        
        return components
    }
}
