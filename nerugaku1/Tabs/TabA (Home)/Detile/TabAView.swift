//
//  TabAView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabAView: View {
    
    @State private var isActive : Bool = false
    
//    ここは変わらないからletで代入しておく？
    let audioContent: AudioContent
    
    var body: some View {
        ScrollView  ( showsIndicators: false){
            VStack{
                BackgroundImage(audioContent: audioContent)
                    .padding(.bottom)
                Description(audioContent: audioContent)
                ForEach (1..<10) { localIndex in
                    CellView(audioContent: self.audioContent)
                }
                RecomendView(audioContent: audioContent)
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView(audioContent: audioContetsData[0])
    }
}
#endif
