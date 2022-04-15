//
//  ConversationView.swift
//  Twitter
//
//  Created by Abbas Ali on 11/04/22.
//

import SwiftUI

struct ConversationView: View {
    @State var showChat = false
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(
                isActive: $showChat, destination: {
                    ChatView()
                } , label: {} )
            
            ScrollView {
                VStack {
                    ForEach(0..<5) { _ in
                        
                        NavigationLink(destination: ChatView(), label: {
                            ConversationCell()
                        })
                        
                        
                    }
                }.padding(.vertical)
            }.padding(.top)
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $isShowingNewMessageView,  content: {
                    NewMessageView(
                        show: $isShowingNewMessageView, startChat: $showChat).padding(.top)
                })
        }
        
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
