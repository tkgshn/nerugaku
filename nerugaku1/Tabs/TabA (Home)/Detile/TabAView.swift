//
//  TabAView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabAView: View {
    
    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContetsData,
            by: { $0.category.rawValue }
        )
    }
    
    @State private var isActive : Bool = false
    @EnvironmentObject var userData: UserData
    var audioContent: AudioContent
    
    var audiocontentIndex: Int {
        userData.audiocontents.firstIndex(where: { $0.id == audioContent.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack{
                BackgroundImage(audioContent: audioContent)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                    .padding(.bottom)
                
                Description(audioContent: audioContent)
                    .padding()
                
//                ここまだいい感じになってない、とりあえず大量に突っ込んでおく
                ForEach (1..<10) { localIndex in
                    CellView(audioContent: self.audioContent)
                }
                
                        
                                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    RecomendView(categoryName: key, items: self.categories[key]!)
                }
                .padding(.top)
                .listRowInsets(EdgeInsets())
                
            }
        }.edgesIgnoringSafeArea(.top)
    }
}



struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return TabAView(audioContent: userData.audiocontents[0])
            .environmentObject(userData)
        
        
    }
}
