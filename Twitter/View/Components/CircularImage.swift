//
//  CircularImage.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI
import Kingfisher

struct CircularImage: View {
    let imageName: String
    
    var body: some View {
        Image("\(imageName)")
            .frame(width:  56, height: 56)
            .scaledToFill()
            .clipped()
            .cornerRadius(56/2)
            
    }
}

struct CircularImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularImage(imageName: "batman")
    }
}
