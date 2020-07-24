
//
//  LyricView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct meme: View {
    var body: some View {
            NavigationView {
                ScrollView  ( showsIndicators: false){
                    

                    //        ここからタグ？カテゴリー？が並んだ要素がはじまる
                    Group{
                        ForEach (1..<20) { localIndex in
                            VStack{
                                HStack{
                                    Future()
                                    Spacer()
                                    Future()
                                }
                                HStack{
                                    Future()
                                    Spacer()
                                    Future()
                                }
                                .padding(.top, -5.0)
                            }
                        }
                            
                            
                            
                        .padding(.top, -5.0)
                    }
                    .padding(.horizontal)
                    
                    
                    
                }
                .navigationBarTitle(Text("Search"))
            }
    }
}

struct meme_Previews: PreviewProvider {
    static var previews: some View {
            meme()
    }
}
