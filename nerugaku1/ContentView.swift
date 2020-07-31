//
//  ContentView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

//
//  ContentView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @State private var isShown: Bool = false
    var audioContent: AudioContent
    
    var body: some View {
        TabView {
            
            Home(audioContent: audioContent)
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
            
//            ここが睡眠の遷移
//            これがクリックした後に表示するview
            TabCView()
                .tabItem {
//                    ここからがタブのアイコンとか
                    VStack {
                        Image(systemName: "bed.double.fill")
                        Text("Sleep")
                    }        .onTapGesture {
                        self.isShown = true
                    }
                    .sheet(isPresented: self.$isShown) {
                        //モーダル遷移した後に表示するビュー
                        HStack {
                            Text("モーダルビュー")
                            Image(systemName: "paperplane")
                        }
                    }
            }.tag(3)
            
            TabDView()
                .tabItem {
                    VStack {
                        Image(systemName: "bookmark.fill")
                        Text("Saved")
                    }
            }.tag(4)
            TabEView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("You")
                    }
            }.tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioContent: audioContetsData[0])
    }
}
