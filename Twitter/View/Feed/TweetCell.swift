//
//  TweetCell.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    var tweet: Tweet
    var body: some View {
        VStack {
            
            
            
            HStack(alignment: .top, spacing: 12) {
                
                
                
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .frame(width:  56, height: 56)

                    .cornerRadius(56/2)
                    .padding(.leading)
                    

                
                
                VStack (alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                        Text("@\(tweet.username) •")
                            .font(.system(size:12, weight: .light))
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .font(.system(size:12, weight: .light))
                            .foregroundColor(.gray)
                    }
                    Text(tweet.caption)
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
//
//struct TweetCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCell()
//    }
//}
