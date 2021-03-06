//
//  Description.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/21.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import UIKit

struct Description: View {
    @EnvironmentObject var userData: UserData
    var audioContent: AudioContent
    
    @State private var isShown: Bool = false
    
    var audioContentIndex: Int {
        userData.audioContents.firstIndex(where: { $0.id == audioContent.id })!
    }
    
    
    
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading) {
                //コンテンツの概要
                HStack {
                    Text(audioContent.description)
                        .multilineTextAlignment(.leading)
                }
                HStack (alignment: .top) {
                    Text(String(audioContent.allfavorite) + "いいね・" + String(audioContent.alltime) + "分")
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.top)
            }.padding()
            
            
            //            ここから操作系のやつ、横並び
            HStack(alignment: .center) {
                //                    Image(systemName: "heart")
                //                        .padding(.trailing, 10.0)
                //                        .font(.system(size: 35.0, weight: .thin))
                
                //                    ここからいいね形の処理
                Button(action: {
                    self.userData.audioContents[self.audioContentIndex]
                        .isFavorite.toggle()
                }) {
                    if self.userData.audioContents[self.audioContentIndex].isFavorite {
                        
                        Image(systemName: "heart.fill")
                            .padding(.trailing, 10.0)
                            .font(.system(size: 35.0, weight: .thin))
                            .foregroundColor(Color.red)
                    } else {
                        Image(systemName: "heart")
                            .padding(.trailing, 10.0)
                            .font(.system(size: 35.0, weight: .thin))
                            .foregroundColor(Color.red)
                    }
                }
                //                    ここまで
                
                
                
                //                    ここから他のアクション
                Image(systemName: "arrow.down.circle")
                    .padding(.horizontal, 3.0)
                    .font(.system(size: 35.0, weight: .thin))
                Image(systemName: "ellipsis")
                    .padding(.horizontal, 13.0)
                    .font(.system(size: 35.0, weight: .thin))
                Spacer()
                
                
                
                //TextやImageをタップした時にトリガーする方法
                Image(systemName: "play.circle.fill")
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 10.0)
                    .frame(width: nil)
                    .font(.system(size: 55.0, weight: .thin))
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.isShown = true
                    }
                    .sheet(isPresented: self.$isShown) {
                        //モーダル遷移した後に表示するビュー
                        AudioPlayerView()
                    }
                
                
            }
            .padding([.leading, .trailing])
        
        
        //            問題を解くボタンを追加
        Button(action: {
        }, label: {
            
            //                    問題数を取得
            Text("問題を解く\n" + String(audioContent.alltime) + "単語")
                
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120.0)
                .frame(height: 55.0)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        })
        .padding(.top)
        
    }
}
}


struct Description_Previews: PreviewProvider {
    static var previews: some View {
        
        //        0番地点の情報を表示
        let userData = UserData()
        return Description(audioContent: userData.audioContents[0])
            .environmentObject(UserData())
        
    }
}



