//
//  ChatView.swift
//  Twitter
//
//  Created by Abbas Ali on 11/04/22.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

