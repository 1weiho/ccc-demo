//
//  MatchPartnerView.swift
//  ccc-demo
//
//  Created by 林彥成 on 2023/6/6.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var hexValue: UInt64 = 0
        
        scanner.scanHexInt64(&hexValue)
        
        let red = Double((hexValue & 0xFF0000) >> 16) / 255.0
        let green = Double((hexValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(hexValue & 0x0000FF) / 255.0
        
        self.init(
            .sRGB,
            red: red,
            green: green,
            blue: blue,
            opacity: 1.0
        )
    }
    
    static let dark = Color(hex: "454545")
}


struct MatchPartnerView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack() {
            // Top Area
            TopAreaView(title: "營友配對")
            
            MatchPartnerTabButtonView()
            
            MatchPartnerTabSelectionView(selectedTab: $selectedTab).padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 28) {
                    MatchPartnerUserInfo(userImage: "littleSpring", userName: "陳小春", userText: "露營新手，渴望學習和分享。")
                    MatchPartnerUserInfo(userImage: "littleSpring", userName: "張小婷", userText: "探險家，喜歡挑戰不同露營地點。")
                    MatchPartnerUserInfo(userImage: "littleSpring", userName: "李美玲", userText: "露營美食家，熱衷於戶外料理。")
                    MatchPartnerUserInfo(userImage: "littleSpring", userName: "王志明", userText: "野外攝影愛好者，追求自然風景的美麗。")
                    MatchPartnerUserInfo(userImage: "littleSpring", userName: "林雅文", userText: "露營活動組織者，熱愛籌辦有趣的活動。")
                }
                .padding(.top)
            }
            
            
            
        }.padding(.top, 20).padding(.horizontal, 32)
    }
}

struct MatchPartnerTabButtonView: View {
    var body: some View {
        HStack(spacing: 16) {
            MatchPartnerTabButton(imageName: "dice", text: "系統配對", buttonGradient: Gradient(stops: [
                Gradient.Stop(color: Color(hex: "3688D5"), location: 0),
                Gradient.Stop(color: Color(hex: "90DFF8"), location: 1.1262)
            ])) {}
            
            MatchPartnerTabButton(imageName: "person", text: "選擇營友", buttonGradient: Gradient(stops: [
                Gradient.Stop(color: Color(hex: "8536D5"), location: 0),
                Gradient.Stop(color: Color(hex: "F890E1"), location: 1.1262)
            ])) {}
        }.padding(.vertical, 15)
    }
}

struct MatchPartnerTabButton: View {
    let imageName: String
    let text: String
    let buttonGradient: Gradient
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack() {
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                        .padding(.top, 18)
                    
                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .padding(.bottom, 18)
                }
                Spacer()
            }.frame(width: 175, height: 175)
                .background(LinearGradient(gradient: buttonGradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(18)
        }.kerning(4)
            .font(.callout)
        
    }
}

struct MatchPartnerTabSelectionView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 16) {
            TabButton(imageName: "flame", text: "推薦營友", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            
            
            TabButton(imageName: "location", text: "附近營友", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            Spacer()
        }
    }
}

struct MatchPartnerUserInfo: View {
    let userImage: String
    let userName: String
    let userText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(userImage)
                    .resizable()
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
                    .padding(.trailing, 4)
                
                VStack {
                    HStack {
                        Text(userName)
                            .font(.system(size: 16))
                            .kerning(4)
                            .padding(.vertical, 1)
                        Spacer()
                    }
                    
                    HStack {
                        Text(userText)
                            .font(.system(size: 14))
                            .foregroundColor(.dark)
                            .kerning(4)
                            .padding(.vertical, 1)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct MatchPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        MatchPartnerView()
    }
}
