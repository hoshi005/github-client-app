//
//  UserList.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserList: View {
    
    @StateObject private var viewModel = UserListViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.secondary)
                TextField("githubユーザ名を入力してください", text: $viewModel.searchText)
                    .disableAutocorrection(true)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(
                Capsule()
                    .strokeBorder(Color.accentColor, lineWidth: 1.0)
            )
            .padding(.horizontal)
            
            List {
                ForEach(viewModel.users) { user in
                    HStack {
                        WebImage(url: user.avatarUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        Text(user.login)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserList()
        }
    }
}
