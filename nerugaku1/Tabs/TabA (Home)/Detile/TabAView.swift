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
    @EnvironmentObject var userData: UserData
    var audioContent: AudioContent
    
    var audiocontentIndex: Int {
        userData.audiocontents.firstIndex(where: { $0.id == audioContent.id })!
    }
    
    var body: some View {
            VStack{
                BackgroundImage(audioContent: audioContent)
                    .padding(.bottom)
                
                Description(audioContent: audioContent)
                
                ForEach (1..<10) { localIndex in
                    CellView(audioContent: self.audioContent)
                }
                        RecomendView(categoryName: audioContetsData[0].category.rawValue,
                        items: Array(audioContetsData.prefix(4)))
            }
        }
    }



struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return TabAView(audioContent: userData.audiocontents[0])
            .environmentObject(userData)
        
        
    }
}
