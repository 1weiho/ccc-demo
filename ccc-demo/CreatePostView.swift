//
//  CreatePostView.swift
//  ccc-demo
//
//  Created by 何奕瑋 on 2023/6/5.
//

import SwiftUI

struct CreatePostView: View {
    
    @State private var inputTitle: String = ""
    @State private var inputContent: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TopAreaView(title: "創建貼文")
            UserProfile()
            Button(action: {
            }) {
                HStack {
                    Text("選擇營地").font(.footnote)
                    Image(systemName: "chevron.down").font(.footnote)
                }
            }.padding(.horizontal, 12).padding(.vertical, 8)
                .background(Color.gray2)
                .foregroundColor(.gray1)
                .cornerRadius(8)
            TextField("標題...", text: $inputTitle)
                .padding(.top, 32)
                .foregroundColor(.gray1)
                .font(.title)
                .bold()
                .kerning(4)
            TextField("敘述...", text: $inputContent)
                .padding(.top, 10)
                .foregroundColor(.gray1)
                .font(.body)
                .kerning(4)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                }) {
                    Text("發布").font(.headline)
                }.padding(.horizontal, 20).padding(.vertical, 10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            
            
        }.padding(.top, 20).padding(.horizontal, 32)
        
        
        
    }
}

struct UserProfile: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            Text("王小明")
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
