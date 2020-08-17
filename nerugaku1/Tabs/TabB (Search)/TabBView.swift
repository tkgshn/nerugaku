//
//  TabBView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TabBView: View {
    //    事前のデータを引っ張ってくる
    var items: [AudioContent]
    @State private var text: String = ""
    @EnvironmentObject var userData: UserData
    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContetsData,
            by: { $0.category.rawValue }
        )
    }
    var featured: [AudioContent] {
        audioContetsData.filter { $0.isFeatured }
    }

    
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                //                ここから検索窓の実装
                ZStack {
                    
                    TextField("キーワードを入力して検索", text: $text)
                        .padding(.horizontal, -20.0)
                        .frame(width:300)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    
                }
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            UIApplication.shared.closeKeyboard()})
                
                //                なぜかここが表示できない
                Future(items: Array(audioContetsData.prefix(10)))
                    .padding(.horizontal, 5.0)
                
 
            }
            .navigationBarTitle(Text("Search"))
            .environmentObject(UserData())
            
        }
    }
}






struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView(items: Array(audioContetsData.prefix(10)))
            .environmentObject(UserData())
    }
}
