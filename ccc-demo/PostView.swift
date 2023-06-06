//
//  PostView.swift
//  ccc-demo
//
//  Created by 林彥成 on 2023/6/6.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack() {
            PostTopBar(imageName: "postImage")
        }.padding(.top)
        
        VStack() {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 28) {
                    PostContent(
                        postTitle: "最佳露營目的地分享！探索大自然的奇妙之旅",
                        postTime: "2023.4.12",
                        userName: "陳小春",
                        postContent: """
                            嗨，露營愛好者們！我們來到了一年一度的露營季節，這是我最期待的時刻之一。今天我們要來分享一些最佳露營目的地，讓你們可以探索大自然的奇妙之旅。無論你是初次嘗試還是有經驗豐富的露營者，這些目的地都將帶給你美妙的回憶和難忘的冒險！
                            
                            格蘭德峽谷國家公園，美國如果你想體驗壯麗的自然景觀，格蘭德峽谷國家公園是一個絕佳的選擇。這個位於美國亞利桑那州的國家公園擁有令人驚嘆的峽谷景色和無數的露營地點。在這裡，你可以進行徒步旅行、攀岩、賞鳥等活動，與大自然真正連結。
                            
                            如果你想追求一種全然不同的露營體驗，冰島的冰川露營絕對是一個值得考慮的選項。在冰川上搭建帳篷，欣賞北極光的奇景，絕對是一生難忘的回憶。冰島還有許多令人驚嘆的自然景觀，如瀑布、火山和熔岩洞穴，讓你的冰島露營之旅更加豐富多彩。
                            """
                    )
                }
                .padding(.top)
            }
        }
        .padding(.horizontal, 32)
    }
}

struct PostTopBar: View {
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(.all)
            
            HStack {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                
                Spacer()
                
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(.trailing, 5)
            }
            .padding(16)
        }
        .padding(.horizontal, 0)
    }
}

struct PostContent: View {
    let postTitle: String
    let postTime: String
    let userName: String
    let postContent: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(postTitle)
                .font(.title)
                .bold()
                .kerning(4)
            
            Text(postTime)
                .font(.system(size: 14))
                .foregroundColor(.gray1)
                .padding(.vertical, 1)
            
            HStack {
                Image("littleSpring")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                Text(userName)
                    .font(.system(size: 18))
                    .kerning(4)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.gray1)
                        .padding(.vertical, 5)
                        .padding(.leading, 5)
                    
                    Text("喜歡")
                        .font(.system(size: 16))
                        .foregroundColor(.gray1)
                        .padding(.vertical, 5)
                        .padding(.trailing, 5)
                    
                    Spacer()
                }
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(7)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.dark, lineWidth: 0.5)
                )
            }.padding(.trailing, 10)
            
            Text(postContent)
                .foregroundColor(.gray1)
                .font(.callout)
                .kerning(1.5)
                .lineSpacing(8)
                .padding(.top, 5)
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
