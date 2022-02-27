//
//  SearchBar.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var focus: FocusState<Bool>.Binding
    var placeholder = "githubユーザ名を入力してください"
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.secondary)
            TextField(placeholder, text: $text)
                .disableAutocorrection(true)
                .submitLabel(.search)
                .focused(focus)
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
    
    @FocusState static var focus: Bool

    static var previews: some View {
        SearchBar(
            text: .constant(""),
            focus: $focus,
            placeholder: "■□□□□□□□□□■□□□□□□□□□■□□□□□□□□□"
        ).previewLayout(.fixed(width: 400, height: 100))
    }
}
