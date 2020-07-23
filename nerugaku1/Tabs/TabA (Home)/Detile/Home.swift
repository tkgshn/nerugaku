//
//  Home.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/15.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ScrollView  ( showsIndicators: false){
                    
                    //                ここからが最初の4つのview
                    VStack{
                        HStack{
                            
                            HStack {
                                
                                Image("Airplane")
                                    .resizable()
                                    .padding(.leading, -40.0)
                                    .frame(width: 30.0, height: 70.0)
                                Text("空港で")
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, -10.0)
                                
                            }.padding(.horizontal, 40.0).background(Color.green)
                            
                            Spacer()
                            HStack {
                                Image("Airplane")
                                    .resizable()
                                    .padding(.leading, -40.0)
                                    .frame(width: 30.0, height: 70.0)
                                Text("空港で")
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, -10.0)
                                
                            }.padding(.horizontal, 40.0).background(Color.green)
                        }
                        .padding(0.0)
                        HStack{
                            HStack {
                                Image("Airplane")
                                    .resizable()
                                    .padding(.leading, -40.0)
                                    .frame(width: 30.0, height: 70.0)
                                Text("空港で")
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, -10.0)
                                
                            }.padding(.horizontal, 40.0).background(Color.green)
                            Spacer()
                            HStack {
                                Image("Airplane")
                                    .resizable()
                                    .padding(.leading, -40.0)
                                    .frame(width: 30.0, height: 70.0)
                                Text("空港で")
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, -10.0)
                                
                            }.padding(.horizontal, 40.0).background(Color.green)
                        }
                        
                        
                    }
                    
                    
                    //                ここからが横スライドの実装
                    VStack {
                        ScrollView  (.horizontal, showsIndicators: false){
                            HStack{
                                //                            1個目
                                VStack {
                                    NavigationLink(destination: TabAView()) {
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
                                    NavigationLink(destination: TabAView()) {
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
                                    NavigationLink(destination: TabAView()) {
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
                    VStack {
                        ScrollView  (.horizontal, showsIndicators: false){
                            HStack{
                                //                            1個目
                                VStack {
                                    NavigationLink(destination: TabAView()) {
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
                                    NavigationLink(destination: TabAView()) {
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
                                    NavigationLink(destination: TabAView()) {
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
                    
                }.navigationBarTitle(Text("Home"))
                
            }
            
        }
    }








//        NavigationView {
//
//            ScrollView  (.horizontal, showsIndicators: false){
//                        HStack{
//                            VStack {
//                                NavigationLink(destination: TabAView()) {
//                                    VStack {
//                                        Image("Airplane")
//                                        HStack{
//                                            Text("空港で")
//                                                .multilineTextAlignment(.leading)
//                                                .padding(.leading, 10.0)
//                                            Spacer()
//                                        }
//                                    }.padding(.horizontal)
//                                }
//                            }
//                            VStack {
//                                NavigationLink(destination: TabAView()) {
//                                    VStack {
//                                        Image("Airplane")
//                                        HStack{
//                                            Text("空港で")
//                                                .multilineTextAlignment(.leading)
//                                                .padding(.leading, 10.0)
//                                            Spacer()
//                                        }
//                                    }.padding(.horizontal)
//                                }
//                            }
//
//
//                        }.navigationBarTitle("Home")
//                    }
//
//
//                }






struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
