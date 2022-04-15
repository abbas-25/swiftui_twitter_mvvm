//
//  NewTweetView.swift
//  Twitter
//
//  Created by Abbas Ali on 15/04/22.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var isShowingNewTweetView: Bool
    @State private var tweetContent = "What's happening?"
    var body: some View {
        
        NavigationView {
            VStack {
                HStack (alignment: .top) {
                        CircularImage(imageName: "batman")
                        TextEditor(
                            text: $tweetContent)
                            .lineLimit(5)
                            .foregroundColor(.gray)
                            .frame(height: 100)
                    }
                .padding()
                .navigationBarItems(
                    
                leading:  Button(action: {
                        isShowingNewTweetView = false
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    }),
                                    
                trailing:    Button(
                    action: {
                        print("Tweeted..!")
                    }, label: {
                        Text("Tweet")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.blue)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                }))
                Spacer()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isShowingNewTweetView: .constant(false))
    }
}
