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
                    Image(systemName: "globe")
                }
                .tag(0)
            
            Text("Explore")
                .tabItem {
                    Image(systemName: "bolt.heart")
                }
                .tag(1)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "plus.circle")
                }
                .tag(2)
            CampTutorialView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(3)
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }.accentColor(.uiPrimary)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
