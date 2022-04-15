//
//  UserProfileView.swift
//  Twitter
//
//  Created by Abbas Ali on 12/04/22.
//

import SwiftUI

struct UserProfileView: View {
    @State private var _selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileViewHeader()
                    .padding()
                
                FilterButtonView(selectedOption: $_selectedFilter)
                    .padding(.bottom)
                
                ForEach(0..<9) { tweet in
                    TweetCell()
                        .padding(.top, 5)
                    
                    
                }
            }
        }
        
        .navigationTitle("batman")
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
