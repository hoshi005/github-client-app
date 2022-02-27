//
//  UserGridView.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/27.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserGridView: View {
    
    @ObservedObject var viewModel: UserListViewModel
    var focus: FocusState<Bool>.Binding
    var namespace: Namespace.ID

    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 4.0),
        count: 2
    )
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.users) { user in
                    UserGridViewItem(user: user, namespace: namespace)
                        .onTapGesture {
                            self.focus.wrappedValue = false
                            withAnimation(.spring()) {
                                self.viewModel.selectedUser = user
                                self.viewModel.isShowDetail = true
                            }
                        }
                }
            }
        }
    }
}


struct UserGridViewItem: View {
    
    let user: User
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            WebImage(url: user.avatarUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .matchedGeometryEffect(id: "\(user.id)-image", in: namespace)
            Text(user.login)
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .background(
            Color.accentColor
                .clipShape(UserInfoShape())
                .matchedGeometryEffect(id: "\(user.id)-bg", in: namespace)
        )
    }
}

struct UserGridView_Previews: PreviewProvider {
    
    @FocusState static var focus: Bool
    @Namespace static var namespace

    static var previews: some View {
        UserGridView(
            viewModel: UserListViewModel(
                users: Constant.SampleData.SEARCH_USER_SAMPLE.items
            ),
            focus: $focus,
            namespace: namespace
        )
    }
}
