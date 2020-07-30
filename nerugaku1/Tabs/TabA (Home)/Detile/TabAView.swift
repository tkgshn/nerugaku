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
    
    var audioContents: AudioContents
    
    var body: some View {
        ScrollView  ( showsIndicators: false){
            VStack{
                BackgroundImage(audioContents: AudioContents.example)
                    .padding(.bottom)
                Description(audioContents: audioContents)
                ForEach (1..<10) { localIndex in
                    CellView(audioContents: audioContetsData[0])
                }
                RecomendView(audioContents: AudioContents.example)
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView(audioContents: AudioContents.example)
    }
}
#endif
