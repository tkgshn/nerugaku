//
//  CircleImage.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/14.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

struct BackgroundImage: View {
    
//    AudioContentの型を取得
    var audioContent: AudioContent
    
    var body: some View {
        
        //        アセットにある画像を取得
        audioContent.image
            //すべてのセーフエリアを無視
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            //ここでタイトルを背景画像にかぶせる
            .padding([.top,.bottom])
            .overlay(
                VStack(alignment: .leading) {
                    Text(audioContent.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
//                    HStack(alignment: .center) {
                    Text(audioContent.description)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
//                    }
                }
                    //                    ここで文字列類の位置を調節
                    .padding(.top)
                    .offset(y: 150)
        )
            
            
            
            .frame(height: 300)
        
    }
    
}







struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        
//        0番地点のデータを表示
            BackgroundImage(audioContent: audioContetsData[0])
            
        
    }
}

