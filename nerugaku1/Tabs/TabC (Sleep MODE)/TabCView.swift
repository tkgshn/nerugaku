//
//  TabCView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabCView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("sleep text")
                    
                    .navigationBarTitle(Text("Sleep"))
                    .environmentObject(UserData())
                
            }
        }
    }
}



struct TabCView_Previews: PreviewProvider {
    //    var audioContent: AudioContent
    static var previews: some View {
       TabCView()
            .environmentObject(UserData())
    }
}




