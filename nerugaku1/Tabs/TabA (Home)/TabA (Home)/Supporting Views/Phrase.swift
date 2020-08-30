//
//  Phrase.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/19.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Phrase: View {
    //    最初にどこから引っ張ってくるのかを宣言
    var audioContent: AudioContent
    
    
    var body: some View {
        //        ここにデータベースから引っ張ってきた名前を入れる
        Text(audioContent.phrase1)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .padding(.vertical, 5.0)
        
        
        
    }
}

//#if DEBUG
struct Phrase_Previews: PreviewProvider {
    static var previews: some View {
        //        何個もあるうちのデータの中から、どれを引っ張ってくるのかを指定
        
//        　Phrase(audioContent: AudioContent.example)
        
        
            Phrase(audioContent: audioContetsData[0])
        
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
//#endif
