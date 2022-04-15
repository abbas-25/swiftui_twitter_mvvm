//
//  SearchView.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
            
            
            VStack (alignment: .leading) {
                ForEach(0..<10) { _ in
                    
                    HStack {
                        
                        Spacer()
                    }
                    
                    NavigationLink(
                        destination: UserProfileView(), label: {
                            UserCell()
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
