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
    
        var body: some View {
                ScrollView  ( showsIndicators: false){
                    VStack{
                        Text("mmemo")
//                        BackgroundImage()
//                            .padding(.bottom)
//                        Description()
//                        ForEach (1..<10) { localIndex in
//                            CellView(audioContents: audioContetsData[0])
//                        }
//                        RecomendView()
                    }
                }.edgesIgnoringSafeArea(.top)
        }
    }

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
