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
    static let light1 = Color(red: 0.962, green: 0.962, blue: 0.962)
    static let uiPrimary = Color(red: 0.418, green: 0.644, blue: 0.983)
    static let indicator1 = Color(red: 0.908, green: 0.413, blue: 0.413)
}

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView() {
            VStack() {
                // Top Area
                TopAreaView(title: "小明，您好！")
                
                // Rest of your content
                SearchBarView(searchText: $searchText)
                
                TabSelectionView(selectedTab: $selectedTab).padding(.top, 12)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 28) {
                        if (selectedTab == 0) {
                            CampusPost()
                            CampusPost()
                            CampusPost()
                        } else {
                            NavigationLink {
                                PostView()
                            } label: {
                                Post(likeCount: 10)
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink {
                                PostView()
                            } label: {
                                Post(likeCount: 23)
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink {
                                PostView()
                            } label: {
                                Post(likeCount: 15)
                            }.buttonStyle(PlainButtonStyle())
                            NavigationLink {
                                PostView()
                            } label: {
                                Post(likeCount: 5)
                            }.buttonStyle(PlainButtonStyle())
                        }
                        
                    }
                    .padding(.vertical)
                }
            }.padding(.top, 20).padding(.horizontal, 32)
        }
    }
}

struct TopAreaView: View {
    var title: String
    var body: some View {
        HStack {
            // User Name
            Text(title)
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

struct Post: View {
    @State private var isLiked = false
    @State private var likeCount: Int
    
    init(likeCount: Int) {
        self.likeCount = likeCount
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("avatar")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("陳小春")
                    .font(.title3)
                    .kerning(2)
            }
            .padding(.bottom, 8)
            
            Text("最佳露營目的地分享！")
                .font(.title2)
                .bold()
                .kerning(4)
                .padding(.bottom, 8)
            
            Text("嗨，露營愛好者們！我們來到了一年一度的露營季節，這是我最期待的時刻之一。今天我們要來分享一些最佳露營目的地，讓你們可以探索大自然...")
                .font(.body)
                .foregroundColor(.dark)
                .lineSpacing(6)
                .kerning(2)
                .padding(.bottom, 8)
            
            HStack {
                Button(action: {
                    if isLiked {
                        likeCount -= 1
                    } else {
                        likeCount += 1
                    }
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart").foregroundColor(isLiked ? Color.red : Color.black)
                }
                
                Text("\(likeCount)")
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
