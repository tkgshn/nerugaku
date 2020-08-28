//
//  TabE.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
//import UIKit

struct TabEView: View {
    var body: some View {
            CostomController()
    }
}


//struct CustomController: UIViewCoRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        let view: UIView = UIView()
//        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        //
//    }
//}


struct TabEView_Previews: PreviewProvider {
    static var previews: some View {
        TabEView()
    }
}

struct CostomController: UIViewControllerRepresentable  {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CostomController>) ->  UIViewControllerType {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let controller = storyboard.instantiateInitialViewController(identifier: "Player")
        let controller = storyboard.instantiateViewController(identifier: "Player")
        
        return controller
        
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}
