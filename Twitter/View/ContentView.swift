//
//  ContentView.swift
//  Twitter
//
//  Created by Abbas Ali on 10/04/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            
            if(viewModel.userSession != nil) {
                NavigationView {
                    
                    TabView {
                        FeedView()
                        
                            .tabItem {
                                Image(systemName: "house")
                                 
                                Text("Home")
                            }
                        
                        SearchView()
                        
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
                        
                        ConversationView()
                        
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                        
                        
                    }
                    
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signOut()
                    }, label: {
                        KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 32, height: 32)
                            .cornerRadius(16)
                    }))
                    
                }
                
            } else {
                LoginView()
            }
            
            
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
