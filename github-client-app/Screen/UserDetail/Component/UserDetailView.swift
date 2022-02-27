//
//  UserDetailView.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/27.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserDetailView: View {
    
    let user: User
    var namespace: Namespace.ID

    var body: some View {
        
        VStack {
            WebImage(url: user.avatarUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240)
                .cornerRadius(16.0)
                .matchedGeometryEffect(id: "\(user.id)-image", in: namespace)

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
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .padding()
        .background(
            Color.accentColor
                .clipShape(UserInfoShape())
                .matchedGeometryEffect(id: "\(user.id)-bg", in: namespace)
        )
    }
}

struct UserDetailView_Previews: PreviewProvider {

    @Namespace static var namespace

    static var previews: some View {
        UserDetailView(user: Constant.SampleData.FETCH_USER_SAMPLE, namespace: namespace)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
