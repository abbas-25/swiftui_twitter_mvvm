//
//  FeedViewModel.swift
//  Twitter
//
//  Created by Abbas Ali on 18/04/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            self.tweets = documents.map({ Tweet(dict: $0.data())})
            
        }
    }
}
