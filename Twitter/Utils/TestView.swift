//
//  ProfileActionButtonView.swift
//  Twitter
//
//  Created by Abbas Ali on 12/04/22.
//

import SwiftUI

struct TestView: View {
//    let viewModel: ProfileViewModel
//    @Binding var isFollowed: Bool
    
    var body: some View {
        
        Group {
            
            if false {
                
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
                        print("DEBUG: follow pressed!")
                    }, label: {
                        Text("Follow")
                            .frame(width: 180, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    })
                        .cornerRadius(20)
                        
                    
                  
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
