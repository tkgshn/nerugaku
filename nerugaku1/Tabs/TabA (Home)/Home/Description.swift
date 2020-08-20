//
//  Description.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/21.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Description: View {
    
    @State private var isShown: Bool = false
    var audioContent: AudioContent
    @EnvironmentObject var userData: UserData
    var audioContentIndex: Int {
        userData.audiocontents.firstIndex(where: { $0.id == audioContent.id })!
    }
    
    
    
    var body: some View {
        
        VStack {
            
            //コンテンツの概要
            Text(audioContent.description)
                
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .trailing], 10.0)
                .frame(height: 70)
            
            
            VStack {
                //コンテンツの「いいね数」「再生時間」
                HStack(spacing: 5.0)   {
                    
                    Text(String(audioContent.allfavorite) + "いいね・" + String(audioContent.alltime) + "分")
                        
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 5.0)
                    Spacer()
                    
                }
                
                
                //            ここから操作系のやつ
                HStack(alignment: .center) {
//                    Image(systemName: "heart")
//                        .padding(.trailing, 10.0)
//                        .font(.system(size: 35.0, weight: .thin))
                    
//                    ここから
                    
                    Button(action: {
                        self.userData.audiocontents[self.audioContentIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.audiocontents[self.audioContentIndex].isFavorite {
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
                    
                    
                    
                    
//                    Button(action: {
//                        self.userData.audiocontents[self.audioContentIndex]
//                            .isFavorite.toggle()
//                    }) {
//                        if self.userData.audiocontents[self.audioContentIndex].isFavorite {
//                            Image(systemName: "heart.fill")
//                                .padding(.trailing, 10.0)
//                                .font(.system(size: 35.0, weight: .thin))
//                                .foregroundColor(Color.red)
//                        } else {
//                            Image(systemName: "heart")
//                                .padding(.trailing, 10.0)
//                                .font(.system(size: 35.0, weight: .thin))
//                                .foregroundColor(Color.red)
//                        }
//                    }
                    
                    
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
                        AudioView()
                    }
                    
                    
                }
                
                
            }
            .padding([.top, .leading, .trailing], 13.0)
            
            
            
            Button(action: {
            }, label: {
                
                //                    問題数を取得
                Text("問題を解く\n" + String(audioContent.allphrase) + "単語")
                    
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120.0)
                    .frame(height: 55.0)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                
                
                
            }).padding([.top, .leading, .trailing], 10.0)
            
        }.multilineTextAlignment(.leading)
            .padding(.all, 10.0)
        
    }
}

//#if DEBUG
struct Description_Previews: PreviewProvider {
    static var previews: some View {
        
//        0番地点の情報を表示
        let userData = UserData()
        return Description(audioContent: userData.audiocontents[0])
            .environmentObject(userData)

        
        //        Description(audioContent: AudioContent.example)
    }
}
//#endif



