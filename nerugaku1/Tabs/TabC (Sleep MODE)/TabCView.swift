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
                       
                       
                       //                ここから検索窓の実装
                       ZStack {
                           
                           Text("キーワードを入力して検索")
                               .padding(.horizontal, -20.0)
                               .frame(width:300)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                           
                           
                           
                       }
                       .gesture(
                           TapGesture()
                               .onEnded { _ in
                                   UIApplication.shared.closeKeyboard()})
                       
                       //                なぜかここが表示できない
                       
                       
                       
        
                   }
                   .navigationBarTitle(Text("Sleep"))
                   .environmentObject(UserData())
                   
               }
    }
}




struct TabCView_Previews: PreviewProvider {
    static var previews: some View {
        TabCView()
    }
}




