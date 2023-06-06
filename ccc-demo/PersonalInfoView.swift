//
//  PersonalInfoView.swift
//  ccc-demo
//
//  Created by 何奕瑋 on 2023/6/6.
//

import SwiftUI

struct PersonalInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Top Area
            TopAreaView(title: "個人頁面")
            
            PersonalInformation().padding(.top, 12)
            OptionGroup().padding(.top, 40)
            
            
            Button(action: {
            }) {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("登出").font(.headline)
                }
            }
            .foregroundColor(.indicator1).padding(.top, 80).frame(maxWidth: .infinity)

            
            
            Spacer()
            
        }.padding(.top, 20).padding(.horizontal, 32)
    }
}

struct PersonalInformation: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("張志相").font(.title2)
                .bold()
                .kerning(4)
            Text("大家好！我是張志相，很高興能在這個平台上和大家相遇。我是一個熱愛探索和學習的人，對於各種新奇的事物都充滿好奇心。").foregroundColor(.dark).lineSpacing(8).kerning(2)
            Button(action: {
            }) {
                HStack {
                    Image(systemName: "pencil")
                    Text("編輯").font(.headline)
                }
                
            }.padding(.horizontal, 20).padding(.vertical, 10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}

struct OptionGroup: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("常用選項").font(.title2)
                .bold()
                .kerning(4)
            
            
            HStack() {
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "envelope.open")
                        Text("收件夾").font(.headline)
                    }
                }
                .frame(width: 155)
                .padding(.vertical, 10)
                .background(Color.light1)
                .foregroundColor(.black)
                .cornerRadius(8)
                
                Spacer()
                
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "bookmark")
                        Text("我的收藏").font(.headline)
                    }
                }
                .frame(width: 155)
                .padding(.vertical, 10)
                .background(Color.light1)
                .foregroundColor(.black)
                .cornerRadius(8)
            }
            
            HStack() {
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("我的預定").font(.headline)
                    }
                }
                .frame(width: 155)
                .padding(.vertical, 10)
                .background(Color.light1)
                .foregroundColor(.black)
                .cornerRadius(8)
                
                Spacer()
                
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "heart")
                        Text("說過的讚").font(.headline)
                    }
                }
                .frame(width: 155)
                .padding(.vertical, 10)
                .background(Color.light1)
                .foregroundColor(.black)
                .cornerRadius(8)
            }
        }
    }
}
