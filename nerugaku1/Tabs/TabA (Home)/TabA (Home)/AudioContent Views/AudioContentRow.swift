//
//  QuestionView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

//struct AllContent: View {
//
//    @EnvironmentObject private var userData: UserData
//
//    var body: some View {
//        List {
//            //            ここで表示を切り替える
////            クリックしている場合はお気に入りのみを表示
//            Toggle(isOn: $userData.showFavoritesOnly) {
//                Text("Show Favorites Only")
//            }
//            //            ここで繰り返し
//            ForEach(userData.audiocontents) { audioContent in
//                //             いいねしてるかの処理
////                クリックしている場合はいいねをしているもののみを表示
//                if !self.userData.showFavoritesOnly || audioContent.isFavorite {
//                    NavigationLink(destination: AudioContentDetail(audioContent: audioContent)) {
//                        AudioContentRow(audioContent: audioContent)
//                    }
//                }
//            }
//        }
//        .navigationBarTitle(Text("すべて表示"))
//    }
//}


//ここでAudioContentRowというリストで表示するもの自体を定義する
struct AudioContentRow: View {
    var audioContent: AudioContent
    
    var body: some View {
        HStack {
            audioContent.image
                .renderingMode(.original)
                .renderingMode(.original)
                .resizable()
                .frame(width: 50, height: 50)
            Text(audioContent.name)
            Spacer()
            
            //            いいねしてた場合
            if audioContent.isFavorite {

                Image("Heart.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
                    
            }
        }
    }
}




//struct AllContent_Previews: PreviewProvider {
//    static var previews: some View {
//        AllContent()
//            .environmentObject(UserData())
//
//    }
//}

