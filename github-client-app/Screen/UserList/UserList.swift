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
        VStack(spacing: 0.0) {
            
            // 検索バー.
            SearchBar(text: $viewModel.searchText)
            
            // ユーザ一覧.
//            UserListView(viewModel: viewModel)
            UserGridView(viewModel: viewModel)
        }
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
        .alert(item: $viewModel.error) {
            Alert(
                title: Text("Error!!"),
                message: Text($0.localizedDescription)
            )
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
