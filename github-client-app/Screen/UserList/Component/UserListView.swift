//
//  UserListView.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.users) { user in
                NavigationLink {
                    UserDetail(
                        isShowDetail: .constant(false),
                        user: user
                    )
                } label: {
                    UserListViewItem(user: user)
                }
            }
        }
    }
}


struct UserListViewItem: View {
    let user: User
    
    var body: some View {
        HStack {
            Capsule()
                .foregroundColor(.accentColor)
                .frame(width: 4, height: 52)
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


struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserListView(
                viewModel: UserListViewModel(
                    users: Constant.SampleData.SEARCH_USER_SAMPLE.items
                )
            )
            
            UserListViewItem(user: Constant.SampleData.SEARCH_USER_SAMPLE.items[0])
                .previewLayout(.fixed(width: 400, height: 160))
        }
    }
}
