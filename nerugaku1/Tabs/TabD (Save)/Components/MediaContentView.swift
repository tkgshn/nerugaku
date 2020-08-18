//
//  MediaContentView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/28.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI


struct MediaContentView: View {
    
    //    var colours : [Color] = [.red, .orange, .green, .pink, .purple, .yellow]
    //    var categoryName: String
    //    var items: [AudioContent]
    //    @EnvironmentObject var userData: UserData
    //    var audioContent: AudioContent
    @EnvironmentObject private var userData: UserData
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            ForEach(userData.audiocontents) { audioContent in
                //                いいねしてるやつを表示？
                                if !self.userData.showFavoritesOnly || audioContent.isFavorite {
                                    NavigationLink(destination: Detail(audioContent: audioContent)) {
                                        ContentRow(audioContent: audioContent)
                                    }
                                }
                //            もしcurrentSubCategoryIndexが0の場合はお気に入りのみ表示する
                    //            もしcurrentSubCategoryIndexが1の場合は全てのコンテンツを表示する
                
            }
            
            
            
            
        }.padding(.leading)
    }
}

//アイテム自体を定義する



struct MediaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContentView()
            .environmentObject(UserData())
    }
}

