//
//  APIRepositoryType.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation
import Combine

protocol APIRepositoryType {
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIError> where Request: APIRequestType
}
