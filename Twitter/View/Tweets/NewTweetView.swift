//
//  NewTweetView.swift
//  Twitter
//
//  Created by Abbas Ali on 15/04/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State private var tweetContent = "What's happening?"
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
        
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack (alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .frame(width:  56, height: 56)
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(56/2)
                        
                    }
                 
                        TextEditor(
                            text: $tweetContent)
                            .lineLimit(5)
                            .foregroundColor(.gray)
                            .frame(height: 100)
                    }
                .padding()
                .navigationBarItems(
                    
                leading:  Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    }),
                                    
                trailing:    Button(
                    action: {
                        viewModel.uploadTweet(content: tweetContent)
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

//struct NewTweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTweetView(isShowingNewTweetView: .constant(false))
//    }
//}
