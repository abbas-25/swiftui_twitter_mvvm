//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Abbas Ali on 16/04/22.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var tweets = [Tweet]()
    
    
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchTweets()
    }
    
    func fetchTweets() {
//        guard user != nil  else { return }
        
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot,_  in
     
            guard let documents = snapshot?.documents else { return }
            
            self.tweets = documents.map({ Tweet(dict: $0.data())})

            
            
            
        }
        
    
        
    }
    
    func follow() {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWING.document(user.id).collection("user-followers")
        
        followingRef.document(self.user.id).setData([:]) { _ in
            
            followersRef.document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
            
        }
    }
    
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWING.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followersRef.document(currentUid).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
            
        }
        
        
    }
}
