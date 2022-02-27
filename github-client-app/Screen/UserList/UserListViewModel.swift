//
//  UserListViewModel.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import Foundation
import Combine

final class UserListViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var users: [User] = []
    @Published var error: APIError?
    
    // GridViewの時に利用する.
    @Published var selectedUser = Constant.SampleData.SEARCH_USER_SAMPLE.items[0]
    @Published var isShowDetail = false
    
    private let repository: APIRepositoryType
    private var disposables = Set<AnyCancellable>()
    
    init(repository: APIRepositoryType = GithubAPIRepository(), users: [User] = []) {
        self.repository = repository
        self.users = users
        
        // インクリメンタルサーチ.
        $searchText
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink( receiveValue: { [weak self] _ in
                self?.search()
            })
            .store(in: &disposables)
        
        searchText = "hoshi"
    }
    
    func search() {
        self.users = []
        
        if searchText.isEmpty {
            return
        }
        
        self.isLoading = true
        
        let request = SearchUserRequest(query: searchText)
        repository.request(with: request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.users = []
                    self.error = error
                case .finished:
                    print("### finished.")
                }
                self.isLoading = false
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.users = response.items
            }
            .store(in: &disposables)
    }
}
