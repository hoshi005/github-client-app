//
//  Model.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

struct SearchUserResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [User]
}

struct User: Codable, Identifiable {
    let login: String
    let id: Int
    let avatarUrl: URL
    let name: String?
    let followers: Int?
    let following: Int?
}

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let htmlUrl: URL
    let description: String?
    let fork: Bool
    let stargazersCount: Int
    let language: String?
}
