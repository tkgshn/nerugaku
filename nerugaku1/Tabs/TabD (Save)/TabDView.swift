//
//  TabDView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabDView: View {
    var body: some View {
                NavigationView {
        
        //            Form {
        //            ForEach(1..<6) { num in
        //                Text("\(num)行目")
        //            }
        //            ContentsRow()
        //        }
        
        List(1..<20) { localIndex in
            // すべての行で共通のビュー
            ContentsRow()
            
            
        }.navigationBarTitle(Text("Save List"))
        }
    }
}





struct TabDView_Previews: PreviewProvider {
    static var previews: some View {
            TabDView()
    }
}
