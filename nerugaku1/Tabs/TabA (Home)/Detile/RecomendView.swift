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
//
                    ForEach (1..<7) { audioContent in

                        VStack {
                            NavigationLink(
                                destination: TabAView(audioContent: audioContetsData[0])
                            ){
                                VStack
                                    {
                                        self.audioContent.image
                                        HStack{
                                            Text(self.audioContent.name)
                                                .multilineTextAlignment(.leading)
                                                .padding(.leading, 10.0)
                                            Spacer()
                                        }



                                }.padding(.horizontal)
                            }
                        }

                    }
//
//
                    
//                    ForEach(userData.landmarks) { landmark in
//                        if !self.userData.showFavoritesOnly || landmark.isFavorite {
//                            NavigationLink(
//                                destination: LandmarkDetail(landmark: landmark)
//                            ) {
//                                LandmarkRow(landmark: landmark)
//                            }
//                        }
//                    }
                    
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
