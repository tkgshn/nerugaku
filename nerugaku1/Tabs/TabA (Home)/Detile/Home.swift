//
//  Home.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/15.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ScrollView  ( showsIndicators: false){
                
                
                VStack{
                    HStack{
                        Future()
                        Spacer()
                        Future()
                    }
                    HStack{
                        Future()
                        Spacer()
                        Future()
                    }
                    .padding(.top, -5.0)
                }
                .padding(.horizontal)
                
                ForEach (1..<4) { localIndex in
                    RecomendView()
                }
                
            }.navigationBarTitle(Text("Home"))
        }
        
    }
    
}












struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
