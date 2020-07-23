//
//  test1.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct test1: View {
    @State private var isActive : Bool = false
    var body: some View {
        NavigationView {
            ScrollView  ( showsIndicators: false){
                VStack{
                    BackgroundImage()
                        .padding(.bottom)
                    Description()
                    CellView()
                    RecomendView()
                }
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

struct test1_Previews: PreviewProvider {
    static var previews: some View {
        test1()
    }
}
