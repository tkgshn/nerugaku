//
//  Recomend.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/23.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct RecomendView: View {
    var categoryName: String
    var items: [AudioContent]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { audioContent in
                        NavigationLink(
                            destination: TabAView(
                                audioContent: audioContent
                            )
                        ) {
                            CategoryItem(audioContent: audioContent)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


//ここでアイテム自体を定義する
struct CategoryItem: View {
    var audioContent: AudioContent
    var body: some View {
        VStack(alignment: .leading) {
            audioContent.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(audioContent.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}




struct Recomend_Previews: PreviewProvider {
    static var previews: some View {
        RecomendView(categoryName: audioContetsData[0].category.rawValue,
            items: Array(audioContetsData.prefix(4))
        )
        .environmentObject(UserData())
        
    }
}

