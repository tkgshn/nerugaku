//
//  ContentView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
            }.tag(1)
            TabBView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }.tag(2)
            TabCView()
                .tabItem {
                    VStack {
                        Image(systemName: "bed.double.fill")
                        Text("Sleep")
                    }
            }.tag(3)
            TabDView()
                .tabItem {
                    VStack {
                        Image(systemName: "bookmark.fill")
                        Text("Saved")
                    }
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
