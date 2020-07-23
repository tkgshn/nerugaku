//
//  Description.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/21.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Description: View {
    var body: some View {
         NavigationView {
        VStack {
            
            //コンテンツの概要
            Text("留学での最初の関門、空港での英語表現を学びましょう！")
                
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .trailing], 10.0)
                .frame(height: 70)
            
            
            VStack {
                //コンテンツの「いいね数」「再生時間」
                HStack(spacing: 5.0)   {
                    Text("665 いいね・15分")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 5.0)
                    Spacer()
                    
                }
                
                
                //            ここから操作系のやつ
                HStack(alignment: .center) {
                    Image(systemName: "heart")
                        .padding(.trailing, 10.0)
                        .font(.system(size: 35.0, weight: .thin))
                    Image(systemName: "arrow.down.circle")
                        .padding(.horizontal, 3.0)
                        .font(.system(size: 35.0, weight: .thin))
                    Image(systemName: "ellipsis")
                        .padding(.horizontal, 13.0)
                        .font(.system(size: 35.0, weight: .thin))
                    Spacer()
                    
                   
                    NavigationLink(destination: PlayerView()) {
                        Image(systemName: "play.circle.fill")
                            .padding(.bottom, 10.0)
                            .frame(width: nil)
                            .font(.system(size: 55.0, weight: .thin))
                            .foregroundColor(.gray)
                    }
                }
                
                    
                }
                .padding([.top, .leading, .trailing], 13.0)
                
                
                
                Button(action: {
                    print("Rounded Button")
                }, label: {
                    
                    Text("問題を解く\n15単語")
                        
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 120.0)
                        .frame(height: 55.0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    
                    
                    
                }).padding([.top, .leading, .trailing], 10.0)
  
            }.multilineTextAlignment(.leading)
            .padding([.top, .leading, .trailing], 10.0)
        }
    }
}

struct Description_Previews: PreviewProvider {
    static var previews: some View {
        Description()
    }
}
