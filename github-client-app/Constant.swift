//
//  Constant.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

struct Constant {
    
    struct SampleData {
        static let SEARCH_USER_SAMPLE = Bundle.main.decode(SearchUserResponse.self, filename: "search_user_sample.json")
        static let FETCH_USER_SAMPLE = Bundle.main.decode(User.self, filename: "fetch_user_sample.json")
        static let FETCH_REPOSITORY_SAMPLE = Bundle.main.decode([Repository].self, filename: "fetch_repository_sample.json")
    }
}
