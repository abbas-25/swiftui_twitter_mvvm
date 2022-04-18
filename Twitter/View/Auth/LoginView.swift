//
//  LoginView.swift
//  Twitter
//
//  Created by Abbas Ali on 15/04/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailController : String = ""
    @State private var passwordController : String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        NavigationView {
            ZStack  {
                VStack {
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom, 40)
                    
                    AuthTextField(prefixImage: "envelope", initialValue: "Email", controller: $emailController)
                        .padding(.bottom, 15)
                    
                    AuthTextField(prefixImage: "lock", initialValue: "Password", controller: $passwordController)
                        .padding(.bottom, 12)
                    
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                    
                    .padding(.bottom, 15)
                    
                    Button(
                        action: {
                            viewModel.login(email: emailController, password: passwordController)
                        }, label: {
                            Text("Sign in")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(width: 360, height: 50)
                        })
                        .background(.white)
                        .clipShape(Capsule())
                        
                        
                    Spacer()
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                        NavigationLink(destination: {
                            SignupView()
                                .navigationBarBackButtonHidden(true)
                        }, label: {
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        } )
                        
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 28)
                
            }
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color(red: 0.113, green: 0.632, blue: 0.954))
            
        .ignoresSafeArea()
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
