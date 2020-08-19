//
//  MediaContentView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/28.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI


struct MediaContentView: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        //        NavigationView {
        List {
//            Toggle(isOn: $userData.showFavoritesOnly) {
//                Text("Show Favorites Only")
//            }
            
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
        }
    }
}

//アイテム自体を定義する



struct MediaContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MediaContentView()
                .environmentObject(UserData())
        }
    }
}

