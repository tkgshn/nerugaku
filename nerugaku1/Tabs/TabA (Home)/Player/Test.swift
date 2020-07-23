//
//  Test.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Test: View {
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: DetailView()) {
                    
                    Image("Airplane")
                        .resizable()
                        .padding(.leading, -40.0)
                        .frame(width: 30.0, height: 70.0)
                    Text("空港で")
                        .multilineTextAlignment(.center)
                        .padding(.trailing, -10.0)
                }.navigationBarTitle("Navigation")
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}


struct DetailView: View {
    var body: some View {
        Text("This is the detail view")
    }
}

