//
//  SignupView.swift
//  Twitter
//
//  Created by Abbas Ali on 15/04/22.
//

import SwiftUI

struct SignupView: View {
    @State private var emailController : String = ""
    @State private var passwordController : String = ""
    @State private var usernameController : String = ""
    @State private var nameController : String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack  {
            VStack {
                Image("plus_photo")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .padding(.top, 88)
                    .padding(.bottom, 40)
                    .foregroundColor(.white)
                
             
                AuthTextField(prefixImage: "person", initialValue: "Name", controller: $nameController)
                    .padding(.bottom, 15)
                
                AuthTextField(prefixImage: "envelope", initialValue: "Email", controller: $emailController)
                    .padding(.bottom, 15)
                
                AuthTextField(prefixImage: "person", initialValue: "Username", controller: $usernameController)
                    .padding(.bottom, 15)
                
                AuthTextField(prefixImage: "lock", initialValue: "Password", controller: $passwordController)
                    .padding(.bottom, 12)
                
             
                .padding(.bottom, 15)
                
                Button(
                    action: {}, label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                    })
                    .background(.white)
                    .clipShape(Capsule())
                    
                    
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                   
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .onTapGesture {
                    mode.wrappedValue.dismiss()
                }
            }
            .padding(.horizontal, 28)
            
        }
        .frame(width: UIScreen.main.bounds.size.width)
        .background(Color(red: 0.113, green: 0.632, blue: 0.954))
        
    .ignoresSafeArea()
    }
    
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
        }
    }
}
