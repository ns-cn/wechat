//
//  ContactsView.swift
//  wechat
//
//  Created by 唐毓俊 on 2023/3/29.
//

import SwiftUI

struct ContactsView: View {
    @State var isPopover = false
    @State var searchText = ""
    @FocusState var isSearchFoucsed
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack{
                TextField("搜索",text: $searchText)
                    .focused($isSearchFoucsed)
                    .padding(10)
                    .background{
                        Color.gray.opacity(0.1)
                    }
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .animation(.easeInOut, value: isSearchFoucsed)
                if isSearchFoucsed{
                    Button {
                        isSearchFoucsed = false
                    } label: {
                        Text("取消")
                            .animation(.easeInOut, value: isSearchFoucsed)
                    }

                }
            }
            VStack{
                ContactsCategoryView(avatarName: "person.fill.badge.plus", color: Color(hex: "ED9541"), title: "新的朋友")
                ContactsCategoryView(avatarName: "message.and.waveform.fill", color: Color(hex: "ED9541"), title: "仅聊天的朋友")
                ContactsCategoryView(avatarName: "person.2.fill", color: Color(hex: "43B55C"), title: "群聊")
                ContactsCategoryView(avatarName: "tag.fill", color: Color(hex: "2778E4"), title: "标签")
                ContactsCategoryView(avatarName: "person.text.rectangle.fill", color: Color(hex: "2778E4"), title: "公众号")
                ContactsCategoryView(avatarName: "person.crop.square.filled.and.at.rectangle.fill", color: Color(hex: "3176CB"), title: "企业微信联系人")
            }
        }
        .toolbar {
            Button {
                isPopover = true
            } label: {
                Image(systemName: "person.badge.plus")
                    .foregroundColor(.black)
            }
            .popover(isPresented: $isPopover) {
                VStack{
                    Text("添加")
                }
            }

        }
    }
}


struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
