//
//  SearchBar.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search...", text: $text)
            .padding(7)
            .padding(.horizontal, 24)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            )

            .padding(.horizontal, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."))
    }
}
