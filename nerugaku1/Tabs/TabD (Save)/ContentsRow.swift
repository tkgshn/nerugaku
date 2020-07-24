//
//  ContentsRow.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct ContentsRow: View {
    var body: some View {
            HStack {
                Image("Airplane")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("空港で")
                Spacer()
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        
    }
}

struct ContentsRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentsRow()
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
