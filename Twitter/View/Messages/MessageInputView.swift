//
//  MessageInputView.swift
//  Twitter
//
//  Created by Abbas Ali on 11/04/22.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    
    var body: some View {
        HStack {
            TextField("message", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {}, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("message"))
    }
}
