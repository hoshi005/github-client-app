//
//  APIError.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation

enum APIError: Error, Identifiable {
    
    case invalidURL(description: String)
    case responseError(description: String)
    case parseError(description: String)
    
    var id: String {
        UUID().uuidString
    }
}
