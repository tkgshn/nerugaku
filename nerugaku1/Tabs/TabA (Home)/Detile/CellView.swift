//
//  CellView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/19.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        Text("ここに音声内で使われる単語が入る")
            .multilineTextAlignment(.leading)
            .lineLimit(1)
        
        
        
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
