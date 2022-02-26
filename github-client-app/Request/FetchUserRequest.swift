//
//  FetchUserRequest.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

struct FetchUserRequest: APIRequestType {
    
    typealias Response = User
    
    var path: String {
        return "/users/\(login)"
    }
    
    // ユーザアカウント.
    let login: String
}
