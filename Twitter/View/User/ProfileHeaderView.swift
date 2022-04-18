//
//  ProfileViewHeader.swift
//  Twitter
//
//  Created by Abbas Ali on 12/04/22.
//

import SwiftUI
import Kingfisher

struct ProfileViewHeader: View {
    @Binding var isFollowed : Bool
    let viewModel: ProfileViewModel
    
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .frame(width:  120, height: 120)
                .scaledToFill()
                .clipped()
                .cornerRadius(60)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Gotham's hero is on twitter!")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            
            HStack (spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            
            .padding()
            
            
            
            ProfileActionButtonView(viewModel: viewModel, isFollowed: $isFollowed)
                
                
            Spacer()
        }
        

    }
}
//
//struct ProfileViewHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileViewHeader()
//    }
//}
