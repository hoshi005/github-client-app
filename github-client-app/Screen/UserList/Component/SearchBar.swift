//
//  SearchBar.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var placeholder = "githubユーザ名を入力してください"
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.secondary)
            TextField(placeholder, text: $text)
                .disableAutocorrection(true)
                .submitLabel(.search)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            Capsule()
                .strokeBorder(Color.accentColor, lineWidth: 1.0)
        )
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(
            text: .constant(""),
            placeholder: "■□□□□□□□□□■□□□□□□□□□■□□□□□□□□□"
        ).previewLayout(.fixed(width: 400, height: 100))
    }
}
