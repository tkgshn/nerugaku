//
//  CategoryText.swift
//  SpotifyWithSwiftUI
//
//  Created by Archie Edwards on 07/06/2020.
//  Copyright © 2020 Archie Edwards. All rights reserved.
//


//一番上の部分、ここでは基本的にテキストだけを取り扱っていることがわかる

import SwiftUI

struct CategoryText: View {
    
//    今のカテゴリーの番号
    @Binding var currentCategoryIndex : Int
//    入れ子ページ
    @Binding var nestedPages : [Int]
    var body: some View {
        HStack(spacing: 20){
            Text("Library")
                .font(.largeTitle).bold()
//                currentCategoryIndexが0の場合、primaryで文字を表示。そうでない場合はsecondaryで文字を表示
                .foregroundColor(self.currentCategoryIndex == 0 ? .primary : .secondary)
//                タップの反応
                .onTapGesture {
                    self.nestedPages = [0,0]
                    withAnimation(.easeIn,{
                        self.currentCategoryIndex = 0
                    })
                }
//            Podcastのカテゴリーテキストを削除
//            Text("Podcasts")
//                .font(.largeTitle).bold()
//                .foregroundColor(self.currentCategoryIndex == 1 ? .primary : .secondary)
//                .onTapGesture {
//                    self.nestedPages = [0,0]
//                    withAnimation(.easeIn,{
//                        self.currentCategoryIndex = 1
//                    })
//                }
            Spacer()
        }.padding([.leading, .top])
    }
}

struct CategoryText_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTextPreview()
    }
    struct CategoryTextPreview: View {
        @State var currentCategoryIndex = 0
        var body: some View{
            CategoryText(currentCategoryIndex: $currentCategoryIndex, nestedPages: .constant([0,0]))
        }
    }
}
