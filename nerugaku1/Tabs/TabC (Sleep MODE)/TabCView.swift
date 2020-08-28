//
//  TabCView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
//import UIKit

struct TabCView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                
                Text("n")
                    
                    .navigationBarTitle(Text("Sleep"))
                    .environmentObject(UserData())
                
            }
        }
    }
}

//struct BackgroundView: UIViewRepresentable {
//func makeUIView(context: Context) -> UIView {
//    let view: UIView = UIView()
//    view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
//    return view
//}
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        //
//    }
//}


struct TabCView_Previews: PreviewProvider {
    //    var audioContent: AudioContent
    static var previews: some View {
       TabCView()
            .environmentObject(UserData())
    }
}




