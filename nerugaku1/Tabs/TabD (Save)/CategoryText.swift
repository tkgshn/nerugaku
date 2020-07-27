//
//  CategoryText.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/28.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct CategoryText: View {
    @Binding var currentCategoryIndex : Int
    @Binding var nestedPages : [Int]
    var body: some View {
        HStack(spacing: 20){
            Text("Music")
                .font(.largeTitle).bold()
                .foregroundColor(self.currentCategoryIndex == 0 ? .primary : .secondary)
                .onTapGesture {
                    self.nestedPages = [0,0]
                    withAnimation(.easeIn,{
                        self.currentCategoryIndex = 0
                    })
                }
            Text("Podcasts")
                .font(.largeTitle).bold()
                .foregroundColor(self.currentCategoryIndex == 1 ? .primary : .secondary)
                .onTapGesture {
                    self.nestedPages = [0,0]
                    withAnimation(.easeIn,{
                        self.currentCategoryIndex = 1
                    })
                }
            Spacer()
        }.padding([.leading, .top])
    }
}

struct CategoryText_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTextPreview()
    }
    struct CategoryTextPreview: View {
        @State var currentCategoryIndex = 0
        var body: some View{
            CategoryText(currentCategoryIndex: $currentCategoryIndex, nestedPages: .constant([0,0]))
        }
    }
}
