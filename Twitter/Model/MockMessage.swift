//
//  MockMessage.swift
//  Twitter
//
//  Created by Abbas Ali on 11/04/22.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES : [MockMessage] = [
        .init(id: 0, imageName: "spiderman", messageText: "hey what's up?", isCurrentUser: false),
        .init(id: 1, imageName: "batman", messageText: "allz good, what's with you?", isCurrentUser: true),
        .init(id: 2, imageName: "spiderman", messageText: "doing well, bruce!", isCurrentUser: false),
        .init(id: 3, imageName: "spiderman", messageText: "How's weather in Gotham?", isCurrentUser: false),
        .init(id: 4, imageName: "batman", messageText: "it's too bad, city is boiling up.. with criminals.", isCurrentUser: true),
        .init(id: 5, imageName: "batman", messageText: "don't worry, i'm up for it", isCurrentUser: true),
        .init(id: 6, imageName: "spiderman", messageText: "yea, you're the hero gotham ... ykwim", isCurrentUser: false)
]
