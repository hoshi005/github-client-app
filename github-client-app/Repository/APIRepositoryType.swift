//
//  APIRepositoryType.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation
import Combine

protocol APIRepositoryType {
    
    /// combineを利用したリクエスト.
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIError> where Request: APIRequestType
    
    /// concurrencyを利用したリクエスト.
    func requestConcurrency<Request>(with request: Request) async throws -> Request.Response where Request: APIRequestType
}
