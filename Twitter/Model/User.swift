//
//  User.swift
//  Twitter
//
//  Created by Abbas Ali on 16/04/22.
//

import Firebase

struct User: Identifiable {
    let id: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    let username: String
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == self.id
    }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        
    }
}
