//
//  GithubAPIRepository.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation
import Combine

final class GithubAPIRepository: APIRepositoryType {
    
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIError> where Request : APIRequestType {
        
        guard let url = request.url.url else {
            let error = APIError.invalidURL(description: "URLが不正です")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(request.basicAuth, forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { data, response in data }
            .mapError {
                APIError.responseError(description: $0.localizedDescription)
            }
            .decode(type: Request.Response.self, decoder: decoder)
            .mapError {
                APIError.parseError(description: $0.localizedDescription)
            }
            .eraseToAnyPublisher()
        
    }
    
    
    func requestConcurrency<Request>(with request: Request) async throws -> Request.Response where Request : APIRequestType {
        
        guard let url = request.url.url else {
            throw APIError.invalidURL(description: "URLが不正です.")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.setValue(request.basicAuth, forHTTPHeaderField: "Authorization")
        let urlRequest = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try decoder.decode(Request.Response.self, from: data)
    }
}
