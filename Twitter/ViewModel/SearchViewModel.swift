//
//  SearchViewModel.swift
//  Twitter
//
//  Created by Abbas Ali on 16/04/22.
//

import Foundation
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.map({
                User(dictionary: $0.data())
            })
            
            print("DEBUG users in search - \(self.users)")
        }
    }
    
    
    
}
