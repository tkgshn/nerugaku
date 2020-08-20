//
//  QuestionView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct AllContent: View {
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            //            ここで表示を切り替える
//            クリックしている場合はお気に入りのみを表示
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            //            ここで繰り返し
            ForEach(userData.audiocontents) { audioContent in
                //             いいねしてるかの処理
//                クリックしている場合はいいねをしているもののみを表示
                if !self.userData.showFavoritesOnly || audioContent.isFavorite {
                    NavigationLink(destination: Detail(audioContent: audioContent)) {
                        ContentRow(audioContent: audioContent)
                    }
                }
            }
        }
        .navigationBarTitle(Text("すべて表示"))
    }
}


//ここでContentRowというリストで表示するもの自体を定義する
struct ContentRow: View {
    var audioContent: AudioContent
    
    var body: some View {
        HStack {
            audioContent.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 50, height: 50)
            Text(audioContent.name)
            Spacer()
            
            //            いいねしてた場合
            if audioContent.isFavorite {
                Image(systemName: "Heart.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentRow(audioContent: audioContetsData[0])
            ContentRow(audioContent: audioContetsData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}



struct AllContent_Previews: PreviewProvider {
    static var previews: some View {
        AllContent()
            .environmentObject(UserData())
        
    }
}

