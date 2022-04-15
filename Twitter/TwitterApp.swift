//
//  TwitterApp.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI
import Firebase

@main
struct TwitterApp: App {
    
        
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
