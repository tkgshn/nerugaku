//
//  Recomend.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct RecomendView: View {
    
    var audioContent: AudioContent
    
    var body: some View {
        
        VStack {
            ScrollView  (.horizontal, showsIndicators: false){
                HStack{
                    
                    ForEach (1..<5) { localIndex in
                        
                        VStack {
                            NavigationLink(
                                destination: TabAView(audioContent: self.audioContent)
                            ){
                                VStack
                                    {
                                        self.audioContent.image
                                        HStack{
                                            Text("空港で")
                                                .multilineTextAlignment(.leading)
                                                .padding(.leading, 10.0)
                                            Spacer()
                                        }
                                        
                                        
                                        
                                }.padding(.horizontal)
                            }
                        }
                        
                    }
                    
                    
                }
            }
            .padding(.vertical)
        }
        
        
        
    }
}

//#if DEBUG
struct Recomend_Previews: PreviewProvider {
    static var previews: some View {
        RecomendView(audioContent: audioContetsData[0])
    }
}
//#endif
