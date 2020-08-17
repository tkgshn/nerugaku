//
//  LyricView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct LyricView: View {
    //        とりあえず関係ないところで作ってみる
    var items: [AudioContent]
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
                //                アイテムを挿入
                Future(items: Array(audioContetsData.prefix(10)))
                    .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle(Text("Home"))
            .environmentObject(UserData())
    }
}


struct LyricView_Previews: PreviewProvider {
    static var previews: some View {
        
        LyricView(items: Array(audioContetsData.prefix(10)))
            .environmentObject(UserData())
        
    }
}
