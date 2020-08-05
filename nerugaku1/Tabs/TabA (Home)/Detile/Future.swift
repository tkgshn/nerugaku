//
//  Future.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Future: View {
    var categoryName: String
    var items: [AudioContent]
    
    var body: some View {
        ForEach(self.items) { audioContent in
            NavigationLink(
                destination: TabAView(
                    audioContent: audioContent
                )
            ){
                
                FutureItem(audioContent: audioContent)
            }
        }
    }
    
    //ここでアイテム自体を定義する
    struct FutureItem: View {
        var audioContent: AudioContent
        var body: some View {
            HStack {
                audioContent.image
                    .resizable()
                    .padding(.leading, -60.0)
                    .frame(width: 10.0, height: 70.0)
                Spacer()
                Text(audioContent.name)
                    .multilineTextAlignment(.leading)
                    .lineLimit(9)
                    .padding(.trailing, -30.0)
                
            }.padding(.horizontal, 60.0).background(Color.green)
        }
    }
    
    
    
    struct Future_Previews: PreviewProvider {
        static var previews: some View {
            FutureItem(audioContent: audioContetsData[0])
    }
    }
}
