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
                
                Description(audioContent: audioContent)
                    .padding()
                
                //                ここまだいい感じになってない、とりあえず大量に突っ込んでおく
                ForEach (1..<10) { localIndex in
                    CellView(audioContent: self.audioContent)
                }
                
                
                //                このままだと全部ここに表示されてしまうので、おすすめだけを表示しなければいけない
                //                ForEach(categories.keys.sorted(), id: \.self) { key in
                //                    RecomendView(categoryName: key, items: self.categories[key]!)
                //                }
                RecomendView(categoryName: audioContetsData[0].category.rawValue,
                             items: Array(audioContetsData.prefix(4))
                )
                    .padding(.vertical)
                    .environmentObject(UserData())
                //                        .padding(.top)
                //                        .listRowInsets(EdgeInsets())
                
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

