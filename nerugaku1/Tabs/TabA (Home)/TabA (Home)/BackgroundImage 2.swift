//
//  CircleImage.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/14.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

struct BackgroundImage: View {
    
    var audioContent: AudioContent
    var body: some View {
        
        //        アセットにある画像を取得
        audioContent.image
            //すべてのセーフエリアを無視
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            //ここでタイトルを背景画像にかぶせる
            .padding(.vertical)
            .overlay(
                VStack(alignment: .leading) {
                    Text(audioContent.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    HStack(alignment: .top) {
                        Text(audioContent.description)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        Spacer()
                        
                    }
                }
                    //                    ここで文字列類の位置を調節
                    .padding(.horizontal)
                    .offset(y: 140)
        )
            
            
            
            .frame(height: 300)
        
    }
    
}






#if DEBUG
struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BackgroundImage(audioContent: audioContetsData[0])
            BackgroundImage(audioContent: audioContetsData[1])
        }
        
//        BackgroundImage(audioContent: AudioContent.example)
        
    }
}
#endif
