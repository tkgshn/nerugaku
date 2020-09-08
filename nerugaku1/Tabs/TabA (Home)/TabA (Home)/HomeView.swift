//
//  HomeView.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/15.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContentData,
            by: { $0.category.rawValue }
        )
    }
    var featured: [AudioContent] {
        audioContentData.filter { $0.isFeatured }
    }
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    //    ヘッダーに置くボタン
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
//                ForEach(categories.keys.sorted(), id: \.self) { key in
//                    CategoryRow(categoryName: key, items: self.categories[key]!)
//                    Divider()
//
//                }
                    ForEach(categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: self.categories[key]!)
                    }
                        Divider()
                .padding(.top)
                .listRowInsets(EdgeInsets())
                
                
                //                               Listの最後にある”全て見る”を担う部分
//                NavigationLink(destination: AllContent()
//                                .environmentObject(UserData())) {
//                    Text("See All")
//                }
                
            }
            
            .navigationBarTitle(Text("Home"))
            .environmentObject(UserData())
        }
        
    }
    
}









struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserData())
    }
}
