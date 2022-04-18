//
//  UserProfileView.swift
//  Twitter
//
//  Created by Abbas Ali on 12/04/22.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State private var _selectedFilter: TweetFilterOptions = .tweets
    @ObservedObject var viewModel : ProfileViewModel
    
    
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileViewHeader(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $_selectedFilter)
                    .padding(.bottom)
                
                
                
                
                ForEach(viewModel.tweets) { tweet in
                    
                    // culprit below
                    TweetCell(tweet: tweet)
                        .padding(.top, 5)

                }
            }
        }
        
        .navigationTitle(viewModel.user.username)
        
    }
}
//
//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
