//
//  FeedView.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI

struct FeedView: View {
    @State private var isShowingNewTweetView: Bool = false
    @ObservedObject var viewModel = FeedViewModel()
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    
                    ForEach(viewModel.tweets) { tweet in
                        TweetCell(tweet: tweet)
                            
                    }
                    .padding(.top, 10)
                }
            }
            
            Button(action: {
                isShowingNewTweetView.toggle()
//                viewModel.signOut()
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding()
                    .fullScreenCover(isPresented: $isShowingNewTweetView) {
                        NewTweetView(isPresented: $isShowingNewTweetView)
                    }
            
            
        }
    }
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
    }
