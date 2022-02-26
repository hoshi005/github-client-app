//
//  SearchUserRequest.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

struct SearchUserRequest: APIRequestType {
    
    typealias Response = SearchUserResponse
    
    var path: String {
        return "/search/users"
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: query),
        ]
    }
    
    // 検索ワード.
    let query: String
}
