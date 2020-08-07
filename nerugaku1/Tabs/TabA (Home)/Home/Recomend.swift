//
//  Recomend.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Recomend: View {
    var categoryName: String
    var items: [AudioContent]
    
    var body: some View {
//        縦方向
        VStack(alignment: .leading) {
//            まずはカテゴリーを表示する
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
//            横向きにスクロールを追加
            ScrollView(.horizontal, showsIndicators: false) {
//                横方向
                HStack(alignment: .top, spacing: 0) {
//                    アイテムがあるかぎり繰り返す
                    ForEach(self.items) { audioContent in
//                        それをクリックできるようにする
                        NavigationLink(
                            destination: Detail(
                                audioContent: audioContent
                            )
                        ) {
//                            下で定義したものを使用
                            CategoryItem(audioContent: audioContent)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


//ここでアイテム自体を定義する
struct CategoryItem: View {
    var audioContent: AudioContent
    var body: some View {
//        縦方向
        VStack(alignment: .leading) {
//            画像を追加
            audioContent.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
//            タイトルを追加
            Text(audioContent.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}




struct Recomend_Previews: PreviewProvider {
    static var previews: some View {
        Recomend(categoryName: audioContetsData[0].category.rawValue,
            items: Array(audioContetsData.prefix(4))
        )
        .environmentObject(UserData())
        
    }
}

