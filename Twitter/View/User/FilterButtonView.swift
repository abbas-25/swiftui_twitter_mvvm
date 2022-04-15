//
//  FilterButtonView.swift
//  Twitter
//
//  Created by Abbas Ali on 12/04/22.
//

enum TweetFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
}

import SwiftUI

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOptions
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                        .frame(width: underlineWidth - 8)
                    })
                }
            }
            
            Rectangle()
                .frame(width:underlineWidth - 24, height: 3, alignment: .center)
                .padding(.leading, padding)
                .foregroundColor(.blue)
                .animation(.spring())
                
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.tweets))
    }
}
