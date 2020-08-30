//
//  AudioPlayerView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 8/30/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct AudioPlayerView: View {
    var body: some View {
        CustomController()
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}


struct CustomController: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomController>) ->  UIViewController {
        
        let storybord = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storybord.instantiateViewController(identifier: "Player")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomController>) {
        
    }
    
}

