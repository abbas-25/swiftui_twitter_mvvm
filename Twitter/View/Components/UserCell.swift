//
//  UserCell.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack (spacing: 12) {
            CircularImage(imageName: "batman")
                .padding(.leading)
            
            VStack (alignment: .leading, spacing: 4) {
                Text("batman")
                    .font(.system(size: 14, weight: .semibold))
                Text("Bruce Wayne")
                    .font(.system(size: 14))
            }
        }
        .foregroundColor(.black)
        
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
