//
//  UserDetail.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI

struct UserDetail: View {
    
    @StateObject private var viewModel = UserDetailViewModel()
    let user: User
    
    var body: some View {
        Text(user.login)
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetail(user: Constant.SampleData.FETCH_USER_SAMPLE)
        }
    }
}
