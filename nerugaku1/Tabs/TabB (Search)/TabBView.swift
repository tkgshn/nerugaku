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
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            TextField("input here", text: $text)
                .frame(width:300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.closeKeyboard()
                    
            }
            
        )
        
    }
}

struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        TabBView()
    }
}
