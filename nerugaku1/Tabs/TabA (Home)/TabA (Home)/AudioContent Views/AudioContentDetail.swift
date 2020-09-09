//
//  AudioContentDetail.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct AudioContentDetail: View {
    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContentData,
            by: { $0.category.rawValue }
        )
    }
    @State private var isActive : Bool = false
    @EnvironmentObject var userData: UserData
    var audioContent: AudioContent
    
    var audiocontentIndex: Int {
        userData.audioContents.firstIndex(where: { $0.id == audioContent.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack{
                BackgroundImage(audioContent: audioContent)
                    .edgesIgnoringSafeArea(.top)
                
                Description(audioContent: audioContent)
                    .padding(.top, 50.0)
                Divider()
                    .padding(.top)
                //                下に書いている
                PhraseRow(audioContent: audioContent)
                    
                    .padding(.top)
                
                CategoryRow(categoryName: audioContentData[0].category.rawValue,
                            items: Array(audioContentData.prefix(4))
                )
                    .padding(.vertical)
                    .environmentObject(UserData())
                
            }
        }.edgesIgnoringSafeArea(.top)
            .environmentObject(UserData())
    }
}




struct AudioContentDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return AudioContentDetail(audioContent: userData.audioContents[0])
            .environmentObject(UserData())
        
    }
}

// MARK: - 単語を表示する部分
struct PhraseRow: View {
    var audioContent: AudioContent
    var body: some View {
        //        Phraseが持っている個数分より多い数、ループを回すとクラッシュしてしまう
        
        ForEach(1..<3) { num in
            //                日本語を取得
            VStack(alignment: .leading) {
                Text(self.audioContent.phrases[String(num)]!.japanese)
                    .padding(.bottom)
            //                英語を取得
            Text(self.audioContent.phrases[String(num)]!.english)
            }
            Divider()
        }
    }
}
