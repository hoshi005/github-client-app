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
    
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 4.0),
        count: 2
    )
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.users) { user in
                    VStack {
                        WebImage(url: user.avatarUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                        Text(user.login)
                            .bold()
                    }
                    .padding()
                }
            }
        }
    }
}

struct UserGridView_Previews: PreviewProvider {
    static var previews: some View {
        UserGridView(
            viewModel: UserListViewModel(
                users: Constant.SampleData.SEARCH_USER_SAMPLE.items
            )
        )
    }
}
