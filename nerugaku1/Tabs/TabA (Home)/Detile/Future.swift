//
//  Future.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Future: View {
    var body: some View {
        NavigationLink(destination: TabAView()) {
            HStack {
                Image("Airplane")
                    .resizable()
                    .padding(.leading, -40.0)
                    .frame(width: 30.0, height: 70.0)
                Text("空港で")
                    .multilineTextAlignment(.center)
                    .padding(.trailing, -10.0)
                
            }.padding(.horizontal, 40.0).background(Color.green)
        }
    }
}

struct Future_Previews: PreviewProvider {
    static var previews: some View {
        Future()
    }
}
