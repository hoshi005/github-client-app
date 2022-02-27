//
//  RepositoryListItem.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/27.
//

import SwiftUI

struct RepositoryListItem: View {
    
    let repository: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack {
                // 言語.
                if let language = repository.language {
                    Text(language)
                        .bold()
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .foregroundColor(.accentColor)
                        .border(Color.accentColor, width: 2.0)
                }
                
                Spacer()
                
                // スター.
                Label {
                    Text("\(repository.stargazersCount)")
                } icon: {
                    Image(systemName: "star.fill")
                }
                .foregroundColor(.yellow)
            }
            
            // リポジトリ名.
            Text(repository.name)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(3)
                .padding(.vertical, 6.0)
            
            // 概要.
            if let description = repository.description {
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct RepositoryListItem_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListItem(repository: Constant.SampleData.FETCH_REPOSITORY_SAMPLE[0])
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
