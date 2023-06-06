//
//  CampTutorialView.swift
//  ccc-demo
//
//  Created by 林彥成 on 2023/6/3.
//

import SwiftUI

extension Color {
    static let primaryColor = Color(red: 107 / 255, green: 164 / 255, blue: 251 / 255)
}

struct CampTutorialView: View {
    @State private var searchText = ""
    @State private var selectedTab = 0
    
    var body: some View {
        VStack() {
            // Top Area
            TopAreaView(title: "露營教學")
            
            // Rest of your content
            CampTutorialSearchBarView(searchText: $searchText)
            
            CampTutorialTabSelectionView(selectedTab: $selectedTab)
                .padding(.top, 12)
                .padding(.trailing, -32)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 28) {
                    CampTutorialCampusPost(postTitle: "完美漢堡的燒烤指南", postPreview: "露營時享受美味的燒烤食物是一種令人愉悅的體驗。漢堡是露營者中常見且受歡迎的選擇之一。本文將分享一個簡單而美味的漢堡烹飪指南...")
                    CampTutorialCampusPost(postTitle: "完美漢堡的燒烤指南", postPreview: "露營時享受美味的燒烤食物是一種令人愉悅的體驗。漢堡是露營者中常見且受歡迎的選擇之一。本文將分享一個簡單而美味的漢堡烹飪指南...")
                    CampTutorialCampusPost(postTitle: "完美漢堡的燒烤指南", postPreview: "露營時享受美味的燒烤食物是一種令人愉悅的體驗。漢堡是露營者中常見且受歡迎的選擇之一。本文將分享一個簡單而美味的漢堡烹飪指南...")
                }
                .padding(.top)
            }
            
            
            
        }.padding(.top, 20).padding(.horizontal, 32)
    }
}

struct CampTutorialSearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray2)
                .padding(.leading, 8)
            
            TextField("尋找教學？", text: $searchText)
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

struct CampTutorialTabSelectionView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                CampTutorialTabButton(imageName: "carrot", text: "烹飪", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                
                CampTutorialTabButton(imageName: "tent", text: "帳篷", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                
                CampTutorialTabButton(imageName: "backpack", text: "裝備", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                
                CampTutorialTabButton(imageName: "mountain.2", text: "環境", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
                
            }
        }
    }
}

struct CampTutorialTabButton: View {
    let imageName: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack() {
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(isSelected ? .white : .gray1)
                        .padding(.top, 18)
                    
                    Text(text)
                        .foregroundColor(isSelected ? .white : .gray1)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .padding(.bottom, 18)
                }
                Spacer()
            }.frame(width: 112)
                .background(isSelected ? Color.primaryColor : Color.gray2)
                .cornerRadius(18)
        }.kerning(4)
            .font(.callout)
        
    }
}

struct CampTutorialCampusPost: View {
    
    let postTitle: String
    let postPreview: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("littleSpring")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                Text("陳小春")
                    .font(.system(size: 20))
                    .bold()
                    .kerning(4)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "carrot")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.leading, 5)
                    
                    Text("烹飪")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.trailing, 5)
                        .bold()
                    
                    Spacer()
                }
                .fixedSize(horizontal: true, vertical: false)
                .background(Color.primaryColor)
                .cornerRadius(7)
            }
            Text(postTitle)
                .foregroundColor(.black)
                .font(.title3)
                .padding(.vertical, 4)
                .kerning(2)
            Text(postPreview)
                .foregroundColor(.gray1)
                .font(.callout)
                .kerning(1.5)
                .lineSpacing(8)
            
            HStack {
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.gray1)
                    .padding(.vertical, 5)
                
                Text("12")
                    .font(.system(size: 16))
                    .foregroundColor(.gray1)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .bold()
                    .kerning(4)
                
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.gray1)
                    .padding(.vertical, 5)
                    .padding(.leading, 15)
                
                Text("5")
                    .font(.system(size: 16))
                    .foregroundColor(.gray1)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .bold()
                    .kerning(4)
                
                Spacer()
            }.padding(.vertical, 4)
        }
    }
}

struct CampTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        CampTutorialView()
    }
}
