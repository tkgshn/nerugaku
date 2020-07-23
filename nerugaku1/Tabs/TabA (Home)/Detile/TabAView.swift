//
//  TabAView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/13.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabAView: View {
    var body: some View {
        List {
            //背景になる画像をBackgroundImageから取得
            BackgroundImage()
                .clipped()
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .scaledToFill()
                .edgesIgnoringSafeArea(.top)
            
            
            Description()
                .clipped()
                .listRowInsets(EdgeInsets())
            
            Spacer()
            
            //                今はデータないので適当に入れておく
            CellView()
            CellView()
            Spacer()
            
            VStack {
                HStack{
                    Text("あなたへのおすすめ")
                        .fontWeight(.bold)
                    Spacer()
                    
                }
                ScrollView  (.horizontal, showsIndicators: false){
                    HStack{
                        //                            1個目
                        VStack {
                            NavigationLink(destination: TabBView()) {
                                VStack {
                                    Image("Airplane")
                                    HStack{
                                        Text("空港で")
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, 10.0)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        //                            2個目
                        VStack {
                            NavigationLink(destination: TabBView()) {
                                VStack {
                                    Image("Airplane")
                                    HStack{
                                        Text("空港で")
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, 10.0)
                                        Spacer()
                                    }
                                }.padding(.leading)
                            }
                        }
                        //                            3個目
                        VStack {
                            NavigationLink(destination: TabBView()) {
                                VStack {
                                    Image("Airplane")
                                    HStack{
                                        Text("空港で")
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading, 10.0)
                                        Spacer()
                                    }
                                    
                                    
                                    
                                }.padding(.leading)
                            }
                        }
                        
                    }
                    
                }
            }
            
            
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}

