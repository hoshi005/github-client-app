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
    @Binding var isShowDetail: Bool
    let user: User
    var namespace: Namespace.ID
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                
                // GridViewから来た時だけ閉じるボタンを表示.
                if isShowDetail {
                    Button {
                        withAnimation(.spring()) {
                            isShowDetail = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                    }
                }
                
                // ユーザ情報.
                UserDetailView(user: user, namespace: namespace)
                    .padding(.top)
            }
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
        .navigationBarHidden(isShowDetail) // GridViewから来た時は非表示にする.
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
    
    @Namespace static var namespace
    
    static var previews: some View {
        NavigationView {
            UserDetail(
                isShowDetail: .constant(true),
                user: Constant.SampleData.FETCH_USER_SAMPLE,
                namespace: namespace
            )
        }
    }
}
