//
//  UserCell.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack (spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .frame(width:  56, height: 56)
                .scaledToFill()
                .clipped()
                .cornerRadius(56/2)
                .padding(.leading )
            
            VStack (alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
            }
        }
        .foregroundColor(.black)
        
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
//        UserCell(user: <#T##User#>)
        VStack {
            
        }
    }
}
