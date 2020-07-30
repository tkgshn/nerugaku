//
//  CellView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/19.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct CellView: View {
//    最初にどこから引っ張ってくるのかを宣言
    var audioContents: AudioContents
    
    var body: some View {
//        ここにデータベースから引っ張ってきた名前を入れる
        Text(audioContents.name)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .padding(.vertical, 5.0)
        
        
        
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
//        何個もあるうちのデータの中から、どれを引っ張ってくるのかを指定
        
        CellView(audioContents: AudioContents.example)
        
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
