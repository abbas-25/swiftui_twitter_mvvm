//
//  ProfileActionButtonView.swift
//  Twitter
//
//  Created by Abbas Ali on 12/04/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let viewModel: ProfileViewModel
    @Binding var isFollowed: Bool
    
    var body: some View {
        
        Group {
            
            if viewModel.user.isCurrentUser {
                
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
                .cornerRadius(20)
            } else {
                HStack {
                    
                    Button(action: {
                        isFollowed ? viewModel.unfollow() : viewModel.follow()
                    }, label: {
                        Text(isFollowed ? "Following" : "Follow")
                            .frame(width: 180, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    })
                        .cornerRadius(20)
                        .zIndex(1)
                    
                  
                    Button(action: {
                        print("DEBUG: message pressed!")
                    }, label: {
                        Text("Message")
                            .frame(width: 180, height: 40)
                            .background(Color.purple)
                            .foregroundColor(.white)
                    })
                        .cornerRadius(20)
                    
                }
            }
            
            
        }
      
        
    }
}
//
//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView(isCurrentUser: false)
//    }
//}
