//
//  Detail.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Detail: View {
    
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
                    .padding(.bottom)
                    .edgesIgnoringSafeArea(.top)
                
                Description(audioContent: audioContent)
                    .padding(.vertical, 20.0)
    
                
                //                ここまだいい感じになってない、とりあえず大量に突っ込んでおく
                ForEach (1..<10) { localIndex in
                    Phrase(audioContent: self.audioContent)
                }
                
                
                //                このままだと全部ここに表示されてしまうので、おすすめだけを表示しなければいけない
                //                ForEach(categories.keys.sorted(), id: \.self) { key in
                //                    Recomend(categoryName: key, items: self.categories[key]!)
                //                }
                Recomend(categoryName: audioContetsData[0].category.rawValue,
                             items: Array(audioContetsData.prefix(4))
                )
                    .padding(.vertical)
                    .environmentObject(UserData())
                //                        .padding(.top)
                //                        .listRowInsets(EdgeInsets())
                
            }
        }.edgesIgnoringSafeArea(.top)
        .environmentObject(UserData())
    }
}




struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return Detail(audioContent: userData.audiocontents[0])
        .environmentObject(UserData())
        
    }
}

