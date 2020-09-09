//
//  TabCView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import HealthKit

// Main Process / First View
struct TabCView: View {
    var body: some View {
        NavigationView{
            // 垂直方向のView設定
            VStack (alignment: .center, spacing: 20) {
                Text("Hello, World!")  // 1つめのテキスト (VStack内のテキストは縦に並ぶ)
                    .font(.largeTitle)  // フォントを変更
                
                // 水平方向のプレビュー設定
                HStack {
                    Text("First APp")  // 2つめのテキスト
                        .font(.subheadline)
                    Text("-First Project-")  // Hstack内のテキストは横に並ぶ
                        .font(.subheadline)
                }
                    .padding(.bottom,100)  // 間に余白を入れる
                
                // これが画面遷移の追加部分
                // 画面遷移先のリンク(DataCollection.swift)とそのトリガーとなるテキストを設定
                VStack (alignment: .center) {
                    NavigationLink(destination: DataCollection()){
                        Text("Start")  // 画面遷移を行うトリガーとなるテキスト
                            .font(.largeTitle)
                    }
                }
                
            }
        }
        
        
    }
}

// Mainのstructのインスタンスを生成し，画面に表示
struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
    }
}
