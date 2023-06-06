//
//  ContentView.swift
//  ccc-demo
//
//  Created by 何奕瑋 on 2023/6/3.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "globe")
                        Text("探索")
                    }
                    
                }
                .tag(0)
            
            Text("Find Friend")
                .tabItem {
                    VStack {
                        Image(systemName: "bolt.heart")
                        Text("配對")
                    }
                }
                .tag(1)
            
            CreatePostView()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("建立")
                    }
                }
                .tag(2)
            CampTutorialView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("教學")
                    }
                }
                .tag(3)
            Text("Profile")
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("個人")
                    }
                }
                .tag(4)
        }.accentColor(.uiPrimary).onAppear {
            UITabBar.appearance().barTintColor = .white
            UITabBar.appearance().unselectedItemTintColor = .gray
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
