//
//  TweetCell.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack {
            
            
            HStack(alignment: .top, spacing: 12) {
                CircularImage(imageName: "batman")
                    .padding(.leading)
                
                
                VStack (alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.system(size: 14, weight: .semibold))
                        Text("@batman •")
                            .font(.system(size:12, weight: .light))
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .font(.system(size:12, weight: .light))
                            .foregroundColor(.gray)
                    }
                    Text("It's not who I am underneath, but what I do that defines me")
                }
                
//                Spacer()
//                Image(systemName: "square.and.pencil")
            }
            .padding(.bottom)
            .padding(.trailing)
            
            
            HStack  {
                
                Button(
                    action: {}, label: {
                        
                        
                        Image(systemName: "bubble.left")
                            .font(.system(size:16))
                            .frame(width: 32, height: 32)
                    }
                )
                
                
                Spacer()
                Button(
                    action: {}, label: {
                        
                        
                        Image(systemName: "arrow.2.squarepath")
                            .font(.system(size:16))
                            .frame(width: 32, height: 32)
                    }
                )
                
                
                Spacer()
                
                Button(
                    action: {}, label: {
                        
                        
                        Image(systemName: "heart")
                            .font(.system(size:16))
                            .frame(width: 32, height: 32)
                    }
                )
                
                Spacer()
                
                Button(
                    action: {}, label: {
                        
                        
                        Image(systemName: "bubble.left")
                            .font(.system(size:16))
                            .frame(width: 32, height: 32)
                    }
                )
                
                
            }
            .padding(.horizontal)
            .foregroundColor(.gray)
            
            Divider()
            
            
        }
        
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
