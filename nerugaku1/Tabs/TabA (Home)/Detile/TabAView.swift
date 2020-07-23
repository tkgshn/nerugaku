//
//  TabAView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabAView: View {
    
        @State private var isActive : Bool = false
    
        var body: some View {
            NavigationView {
                ScrollView  ( showsIndicators: false){
                    VStack{
                        BackgroundImage()
                            .padding(.bottom)
                        Description()
                        CellView()
                        CellView()
                        RecomendView()
                    }
                }.edgesIgnoringSafeArea(.top)
            }
        }
    }

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
