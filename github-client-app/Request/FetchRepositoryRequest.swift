//
//  FetchRepositoryRequest.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

struct FetchRepositoryRequest: APIRequestType {
    
    typealias Response = [Repository]
    
    var path: String {
        return "/users/\(login)/repos"
    }
    
    // ユーザアカウント.
    let login: String
}
