//
//  QuestionView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI


struct QuestionView: View {
    var audioContent: AudioContent
    var items: [AudioContent]
    var body: some View {
        ForEach(self.items) { audioContent in
            NavigationLink(
                destination: Detail(
                    audioContent: audioContent
                )
            ) {
                HStack {
                    //            ここに画像
                    audioContent.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 50, height: 50)
                    //        ここにデータベースから引っ張ってきた名前を入れる
                    Text(audioContent.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(audioContent: self.audioContent, items: Array(audioContetsData.prefix(4)))
            .environmentObject(UserData())
    }
}
