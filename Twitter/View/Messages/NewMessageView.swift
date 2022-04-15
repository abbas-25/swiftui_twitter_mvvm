//
//  NewMessageView.swift
//  Twitter
//
//  Created by Abbas Ali on 11/04/22.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
            
            
            VStack (alignment: .leading) {
                ForEach(0..<10) { _ in
                    
                    HStack {
                        Spacer()
                    }
                    
                    Button(action: {
                        self.show.toggle()
//                        self.startChat.toggle()
                    }, label: {
                        UserCell()
                    })
                    
                    
                }
            }
            .padding(.leading)
            .padding(.top)
        }
        
       
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
