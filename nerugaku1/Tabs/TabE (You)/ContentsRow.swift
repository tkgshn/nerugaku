//
//  ContentsRow.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct ContentsRow: View {
    
    var audioContent: AudioContent
    
    var body: some View {
        HStack {
            audioContent.image
                .resizable()
                .frame(width: 50, height: 50)
            Text("空港で")
            Spacer()
            
            if audioContent.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct ContentsRow_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentsRow(audioContent: AudioContent.example)
        Group {
            ContentsRow(audioContent: audioContetsData[0])
            ContentsRow(audioContent: audioContetsData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
