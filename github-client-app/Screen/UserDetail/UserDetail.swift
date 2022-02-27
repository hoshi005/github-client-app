//
//  UserDetail.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserDetail: View {
    
    @StateObject private var viewModel = UserDetailViewModel()
    let user: User
    
    var body: some View {
        
        VStack {
            // ユーザ情報.
            UserDetailView(user: user)
                .padding(.horizontal)
            
            // リポジトリ一覧.
            List {
                ForEach(viewModel.repositories) { repository in
                    RepositoryListItem(repository: repository)
                        .onTapGesture {
                            viewModel.selectedRepository = repository
                        }
                }
            }
        }
        .background(Color("BackgroundColor"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(user.login)
        .onAppear {
            viewModel.fetch(login: user.login)
        }
        .alert(item: $viewModel.error) {
            Alert(
                title: Text("Error!!"),
                message: Text($0.localizedDescription)
            )
        }
        .sheet(item: $viewModel.selectedRepository) {
            SafariView(url: $0.htmlUrl)
        }
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetail(user: Constant.SampleData.FETCH_USER_SAMPLE)
        }
    }
}
