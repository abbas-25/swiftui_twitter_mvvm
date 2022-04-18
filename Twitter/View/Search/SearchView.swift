//
//  SearchView.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
            
            
            VStack (alignment: .leading) {
                ForEach(viewModel.users) { user in
                    
                    HStack {
                        
                        Spacer()
                    }
                    
                    NavigationLink(
                        destination: UserProfileView(user: user), label: {
                            UserCell(user: user)
                        })
                  
                    
                }
            }
            .padding(.leading)
            .padding(.top)
        }
        
       
        
    }
        
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
