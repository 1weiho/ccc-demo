//
//  ContentView.swift
//  ccc-demo
//
//  Created by 何奕瑋 on 2023/6/3.
//

import SwiftUI

extension Color {
    static let gray1 = Color(red: 0.4, green: 0.4, blue: 0.4)
    static let gray2 = Color(red: 0.851, green: 0.851, blue: 0.851)
    static let uiPrimary = Color(red: 0.418, green: 0.644, blue: 0.983)
}

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedTab = 0
    
    var body: some View {
        
        VStack() {
            // Top Area
            TopAreaView()
            
            // Rest of your content
            SearchBarView(searchText: $searchText)
            
            TabSelectionView(selectedTab: $selectedTab).padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 28) {
                    CampusPost()
                    CampusPost()
                    CampusPost()
                }
                .padding(.top)
            }
            
            
            
        }.padding(.top, 20).padding(.horizontal, 32)
    }
}

struct TopAreaView: View {
    var body: some View {
        HStack {
            // User Name
            Text("小明，您好！")
                .font(.title)
                .bold()
                .kerning(4)
            
            
            Spacer()
            
            // User Image
            Image("avatar")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
        }
    }
}


struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray2)
                .padding(.leading, 8)
            
            TextField("尋找營地？", text: $searchText)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .kerning(4)
                .foregroundColor(.black)
                .background(Color.white)
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.black)
                .padding(.trailing, 8)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Color.gray2, lineWidth: 1)
        )
    }
}

struct TabSelectionView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 16) {
            TabButton(imageName: "house", text: "營地", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            
            
            TabButton(imageName: "heart", text: "貼文", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            Spacer()
        }
    }
}

struct TabButton: View {
    let imageName: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(isSelected ? .black : .gray2)
                
                Text(text)
                    .foregroundColor(isSelected ? .black : .gray2)
            }
        }.kerning(4)
            .font(.callout)
    }
}

struct CampusPost: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("campus")
                .resizable()
                .frame(maxWidth: .infinity)
                .cornerRadius(16)
                .padding(.bottom, 6)
            Text("久良栖露營區")
                .foregroundColor(.black)
                .font(.title3)
                .kerning(2)
            Text("台中市和平區東關路1段360之5號")
                .foregroundColor(.gray1)
                .font(.callout)
                .kerning(1)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
