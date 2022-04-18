//
//  UploadTweetViewModel.swift
//  Twitter
//
//  Created by Abbas Ali on 18/04/22.
//

import Foundation
import Firebase
import SwiftUI

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(content caption: String) {

        guard let user = AuthViewModel.shared.user else { return }
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = [
            "uid": user.id,
            "caption": caption,
            "fullname": user.fullname,
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "likes": 0,
            "id": docRef.documentID
        ]
        
        
        docRef.setData(data) { error in
            guard error == nil else {
                print("Error in uploading tweet \(String(describing: error?.localizedDescription))")
                return
            }
            
            print("Tweet uploaded successfully!")
            self.isPresented = false
            
        }
        
    }
}
