//
//  UserDetailViewModel.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation
import Combine

final class UserDetailViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var repositories: [Repository] = []
    @Published var isLoading = false
    @Published var error: APIError?
    
    private let repository: APIRepositoryType
    private var disposables = Set<AnyCancellable>()
    
    init(repository: APIRepositoryType = GithubAPIRepository()) {
        self.repository = repository
    }
    
    func fetch(login: String) {
        self.user = nil
        self.repositories = []
        self.isLoading = true
        
        repository.request(with: FetchUserRequest(login: login))
            .receive(on: DispatchQueue.main)
            .flatMap { [unowned self] user -> AnyPublisher<FetchRepositoryRequest.Response, APIError> in
                self.user = user
                return self.repository.request(with: FetchRepositoryRequest(login: login))
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.user = nil
                    self.repositories = []
                    self.error = error
                case .finished:
                    print("### finished.")
                }
                self.isLoading = false
            } receiveValue: { [weak self] repositories in
                guard let self = self else { return }
                self.repositories = repositories.filter {
                    $0.fork == false
                }
            }
            .store(in: &disposables)
    }
}
