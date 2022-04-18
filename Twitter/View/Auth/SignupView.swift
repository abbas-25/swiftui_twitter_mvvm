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
    @State private var showImagePicker : Bool = false
    
    @State private var selectedUIImage : UIImage?
    @State private var image : Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack  {
            VStack {
                
                Button(
                    action: {
                        showImagePicker.toggle()
                    }, label: {
                        ZStack {
                            
                            if let image = image {
                                
                                image
                                    .resizable()
                            
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                                    .padding(.top, 88)
                                    .padding(.bottom, 16)
                                    
                                
                                
                            } else {
                                
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                            .foregroundColor(.white)
                            }
                        }
                    })
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                        loadImage()
                    }, content: {
                        ImagePicker(image: $selectedUIImage)
                    })
                    
                
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
                    action: {
                        viewModel.registerUser(email: emailController, name:nameController, password: passwordController, username: usernameController, profileImage: selectedUIImage)
                    }, label: {
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
       SignupView()
    }
}
