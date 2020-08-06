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
    var audioContent: AudioContent
    @State private var text: String = ""
    
    
    var body: some View {
        NavigationView {
            ScrollView  ( showsIndicators: false){
                
                //                ここから検索窓の実装
                ZStack {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    
                    TextField("キーワードを入力して検索", text: $text)
                        .padding(.horizontal, -20.0)
                        .frame(width:300)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                .padding(.bottom)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            UIApplication.shared.closeKeyboard()
                            
                    }
                    
                    
                )
                
                ForEach (1..<10) { localIndex in
                    HStack {
                        Future(categoryName: audioContetsData[0].category.rawValue, items: Array(audioContetsData.prefix(4)))
                        .environmentObject(UserData())

                        Future(categoryName: audioContetsData[0].category.rawValue, items: Array(audioContetsData.prefix(4)))
                        .environmentObject(UserData())
                    }
                }
            }
            .navigationBarTitle(Text("Search"))
        }
        
    }
}





struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView(audioContent: audioContetsData[4])
    }
}
