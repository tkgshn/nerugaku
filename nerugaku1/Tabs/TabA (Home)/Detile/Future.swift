//
//  Future.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Future: View {
    
    var audioContent: AudioContent
    
    var body: some View {
        NavigationLink(destination: TabAView(audioContent: audioContent)) {
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
}

//#if DEBUG
struct Future_Previews: PreviewProvider {
    static var previews: some View {
        Future(audioContent: audioContetsData[0])
    }
}
//#endif
