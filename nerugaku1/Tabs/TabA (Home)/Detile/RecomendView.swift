//
//  Recomend.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct RecomendView: View {
    
    var audioContents: AudioContents
    
    var body: some View {
            
            VStack {
                ScrollView  (.horizontal, showsIndicators: false){
                    HStack{
                        
                        ForEach (1..<5) { localIndex in
                        
                        VStack {
                            NavigationLink(destination: TabAView(audioContents: AudioContents.example)) {
                                VStack {
                                    Image("Airplane")
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

#if DEBUG
struct Recomend_Previews: PreviewProvider {
    static var previews: some View {
        RecomendView(audioContents: AudioContents.example)
    }
}
#endif
