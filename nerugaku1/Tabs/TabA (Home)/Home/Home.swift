//
//  Home.swift
//  nerugaku
//
//  Created by Shunsuke Takagi on 2020/07/15.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContetsData,
            by: { $0.category.rawValue }
        )
    }
    var featured: [AudioContent] {
        audioContetsData.filter { $0.isFeatured }
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
            List {                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    Recomend(categoryName: key, items: self.categories[key]!)
                }
                .padding(.vertical)
                .listRowInsets(EdgeInsets())
                
//                               Listの最後にある”全て見る”を担う部分
                NavigationLink(destination: AllContent()
                                .environmentObject(UserData())) {
                                    Text("See All")
                                }
                
            }
            .navigationBarTitle(Text("Home"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                AllContent()
                .environmentObject(UserData())
            }
            
        }
        
    }
    
}







struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserData())
    }
}
