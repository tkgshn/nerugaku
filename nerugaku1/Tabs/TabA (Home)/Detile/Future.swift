//
//  Future.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Future: View {
    var categoryName: String
    var items: [AudioContent]
    
    var body: some View {
        
            //                    アイテムがあるかぎり繰り返す
            ForEach(self.items) { audioContent in
                

                NavigationLink(
                    destination: TabAView(
                        audioContent: audioContent
                    )
                ){
                    //            　　 ここでアイテムを呼び出す
                    FutureItem(audioContent: audioContent)
                }
            }
        }
        
        //ここにアイテム
        struct FutureItem: View {
            var audioContent: AudioContent
            var body: some View {
                //        横方向
                HStack {
                    //            ここに画像
                    audioContent.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 50, height: 50)
                    //        ここにデータベースから引っ張ってきた名前を入れる
                    Text(audioContent.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                //            .frame(width: 150.0, height: 50.0)
                
            }
        }
        
        
        
        
        struct Future_Previews: PreviewProvider {
            static var previews: some View {
                Future(categoryName: audioContetsData[0].category.rawValue, items: Array(audioContetsData.prefix(4)))
                    .environmentObject(UserData())
                    .previewLayout(.fixed(width: 150, height: 50))
            }
}

}
