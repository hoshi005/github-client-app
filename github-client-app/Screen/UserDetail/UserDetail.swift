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
            WebImage(url: user.avatarUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240)
                .cornerRadius(16.0)
            
            Text(user.login)
                .font(.title)
                .fontWeight(.bold)
            
            if let name = user.name {
                Text(name)
                    .font(.body)
                    .fontWeight(.bold)
            }
            
            HStack {
                Group {
                    Text("フォロワー: \(user.followers ?? 0)")
                    Text("フォロイー: \(user.following ?? 0)")
                }
                .font(.caption)
            }
            
            List {
                ForEach(viewModel.repositories) { repository in
                    Text(repository.name)
                        .onTapGesture {
                            viewModel.selectedRepository = repository
                        }
                }
            }
        }
        .frame(maxWidth: .infinity)
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
