//
//  UserList.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserList: View {
    
    @EnvironmentObject var remoteConfigManager: RemoteConfigManager
    @StateObject private var viewModel = UserListViewModel()
    
    @FocusState private var focus: Bool
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0.0) {
                
                // 検索バー.
                SearchBar(text: $viewModel.searchText, focus: $focus)
                
                // ユーザ一覧を remote config の値で分岐.
                switch remoteConfigManager.layoutType {
                case .typeA:
                    UserListView(viewModel: viewModel)
                case .typeB:
                    UserGridView(
                        viewModel: viewModel,
                        focus: $focus
                    )
                default:
                    Spacer()
                }
            }
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
            .alert(item: $viewModel.error) {
                Alert(
                    title: Text("Error!!"),
                    message: Text($0.localizedDescription)
                )
            }
            .onAppear {
                viewModel.searchText = "hoshi"
            }
            
            // GridViewでユーザを選択されたらここが動く.
            if viewModel.isShowDetail {
                UserDetail(
                    isShowDetail: $viewModel.isShowDetail,
                    user: viewModel.selectedUser
                )
            }
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserList()
                .environmentObject(RemoteConfigManager())
        }
    }
}
