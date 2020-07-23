//
//  CircleImage.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/14.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        
        //        アセットにある画像を取得
        Image("Airplane")
            //すべてのセーフエリアを無視
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            //ここでタイトルを背景画像にかぶせる
            .overlay(
                VStack(alignment: .leading) {
                    Text("空港で")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    HStack(alignment: .top) {
                        Text("留学の前に学びたい英語表現")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        Spacer()
                        
                    }
                }
                    //                    ここで文字列類の位置を調節
                    .padding([.top, .leading, .trailing])
                    .offset(y: 100)
        )
            
            
            
            .frame(height: 300)
        
    }
    
}







struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
        
    }
}
