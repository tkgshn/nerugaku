//
//  QuestionView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI


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

