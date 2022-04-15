//
//  AuthTextField.swift
//  Twitter
//
//  Created by Abbas Ali on 15/04/22.
//

import SwiftUI

struct AuthTextField: View {
    var prefixImage: String
    var initialValue: String
    @Binding var controller : String
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: prefixImage)
                    .foregroundColor(.white)
                
                if initialValue == "Password" {
                    SecureField(initialValue,  text: $controller)
                        .padding(.leading, 5)
                } else {
                    TextField(initialValue,  text: $controller)
                        .padding(.leading, 5)
                        .foregroundColor(.white)
                        
                }
            }
            
            
            .padding()
            
        }
        
        .background(Color(.init(white: 1, alpha: 0.25)))

        
        .cornerRadius(8)
        
        
        
        
        
        
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(prefixImage: "envelope", initialValue: "Email",  controller: .constant("Email"))
            .background(Color.green)
    }
}
