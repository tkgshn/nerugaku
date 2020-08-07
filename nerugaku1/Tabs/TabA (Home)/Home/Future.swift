//
//  Future.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import QGrid

struct Future: View {
    var items: [AudioContent]
    var body: some View {
        
        QGrid(self.items, columns: 2) { audioContent in
            //            NavigationLink(
            //                destination: Detail(
            //                    audioContent: audioContent
            //                )
            //            ) {
            FutureItem(audioContent: audioContent)
            //            }
        }
    }
}

//struct GridCell: View {
//    var audioContent: AudioContent
//
//    var body: some View {
//        //        NavigationLink(destination: Detail(audioContent: audioContent)) {
//        FutureItem(audioContent: self.audioContent)
//        //        }
//    }
//}



//ここでアイテムを定義する
struct FutureItem: View {
    var audioContent: AudioContent
    var body: some View {
        NavigationLink(
            destination: Detail(
                audioContent: audioContent
            )
        ) {
            HStack {
                //            ここに画像
                audioContent.image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 50)
                //        ここにデータベースから引っ張ってきた名前を入れる
                Text(audioContent.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
        }
    }
}

struct Future_Previews: PreviewProvider {
    static var previews: some View {
        Future(items: Array(audioContetsData.prefix(4)))
            .environmentObject(UserData())
    }
}
