//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Abbas Ali on 15/04/22.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    
    func login(email: String, password: String) {
        guard !email.isEmpty else { return }
        guard !password.isEmpty  else { return }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
            guard error == nil else {
                print("DEBUG: failed to login \(String(describing: error?.localizedDescription))")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
            
    
        })
    }
    
    func registerUser(email:String, name:String,  password:String, username:String, profileImage: UIImage?) {
        
        guard profileImage != nil else { return }
        guard !email.isEmpty else { return }
        guard !password.isEmpty  else { return }
        guard !username.isEmpty  else { return }
        guard !name.isEmpty  else { return }
        
        print("DEBUG: all values available")
        
        
        guard let imageData = profileImage?.jpegData(compressionQuality: 0.3) else { return }
        
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to upload the image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                
                Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                    if let error = error {
                        print("DEBUG: error \(error.localizedDescription)");
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email.lowercased(),
                                "username": username.lowercased(),
                                "fullname": name,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid,
                            ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                        
                        guard error == nil else {
                            print("DEBUG: Error uploading signup data \(String(describing: error?.localizedDescription))")
                            return
                        }
                        print("DEBUG: Successfully uploaded user data..")
                        self.userSession = user
                        self.fetchUser()
                        
                    }
                    
                    print("DEBUG: Successfully created a user")
                })
                
            }
        }
    
    }
    
    
    
    func fetchUser() {
        print("DEBUG: fetchUser \(String(describing: userSession?.uid))")
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
            
            print("DEBUG: user is \(self.user?.username ?? "nil")")
            
        }
    }

    
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    
    
}
