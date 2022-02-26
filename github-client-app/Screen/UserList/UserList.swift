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
            
            // 検索バー.
            SearchBar(text: $viewModel.searchText)
            
            // ユーザ一覧.
            UserListView(viewModel: viewModel)
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
