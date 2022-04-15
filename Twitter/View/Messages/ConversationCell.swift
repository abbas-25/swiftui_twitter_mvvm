//
//  ConversationCell.swift
//  Twitter
//
//  Created by Abbas Ali on 11/04/22.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack (spacing: 12) {
            CircularImage(imageName: "batman")
                .padding(.leading)
            
            VStack (alignment: .leading, spacing: 4) {
                Text("batman")
                    .font(.system(size: 14, weight: .semibold))
                Text("Longer message cell.. Longer message cell Longer message cell Longer message cell")
                    .font(.system(size: 15))
                    .lineLimit(2)
            }
            .foregroundColor(.black)
            
            .padding(.trailing)
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
