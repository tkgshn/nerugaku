//
//  SubCategoryText.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 07/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//

import SwiftUI

struct SubCategoryText: View {
//    サブカテゴリーという概念を定義する
    var subCategorys : [String]
    @Binding var currentSubCategoryIndex : Int
    @Binding var indicatorOffset : CGFloat
    var body: some View {
        HStack{
//            サブカテゴリーを3つ横に並べる、これらはPlaylist・Alubums・Artistsの3つ、判定はsubCategoryも持っている引数「index」で判定している
                           
            subCategory(index: 0, parent: self)         
            subCategory(index: 1, parent: self)
//            subCategory(index: 2, parent: self)
            Spacer()
        }
        
    }
    
//    さっき上に出てきたsubCategoryの概念を制作している
    struct subCategory: View{
//        indexを定義する
        var index: Int
//        親のView（？）
        var parent: SubCategoryText
        var body: some View{
//            縦向き
            
//            if parent.currentSubCategoryIndex == index {
//                Text("newn")
//            }
            VStack{
//                SubCategoryの中のテキストをindexから取得する
                Text(parent.subCategorys[index])
                    .font(.headline)
//                    「今表示している場所（parent.currentSubCategoryIndex）」が「自分が割り振られた数字（index）」と一致している場合は.primaryの文字色に。そうでない場合は.secondaryに。
                    .foregroundColor(parent.currentSubCategoryIndex == index ? .primary : .secondary)
                    .onTapGesture {
                        withAnimation(.easeIn,{
                            self.parent.currentSubCategoryIndex = self.index
                        })
                    }
//                下の線を作る
                Rectangle()
                    .frame(height: 2)
                    .offset(x: parent.indicatorOffset)
                    //                    「今表示している場所（parent.currentSubCategoryIndex）」が「自分が割り振られた数字（index）」と一致している場合は.primaryの文字色に。そうでない場合は.secondaryに。
                    .foregroundColor(parent.currentSubCategoryIndex == index ? .green : .clear)
                    .animation(.none)
            }.fixedSize().padding(.leading)
        }
    }
}

struct SubCategoryText_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryTextPreview()
    }
    struct SubCategoryTextPreview : View{
        @State var currentSubCategoryIndex = 0
        @State var indicatorOffset: CGFloat = 0
        var body: some View{
//            ここで辞書にString型で引数を設定してあげる
            SubCategoryText(subCategorys: ["お気に入り", "再生履歴"], currentSubCategoryIndex: self.$currentSubCategoryIndex, indicatorOffset: self.$indicatorOffset)
        }
    }
}
