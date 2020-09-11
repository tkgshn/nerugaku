//
//  FutureRow.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 9/11/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

// MARK: - CategoryObject
struct CategoryObject: View {
    
    var categoryName: String
    var items: [AudioContent]
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: SearchCategoryItem(categoryName: categoryName, items: self.items
                )
            ) {
                Text(self.categoryName)
                    .padding(.leading, 10.0)
            }
        }
        .frame(width: 190, height: 60)
        .background(Color(red: 38/255, green: 39/255, blue: 10/255, opacity: 40/255))
        //        }
    }
}




//struct CategoryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRow(categoryName: audioContentData[0].category.rawValue,
//                    items: Array(audioContentData.prefix(4))
//        )
//            .environmentObject(UserData())
//
//    }
//}


//// MARK: - CategoryObjectLink
//struct CategoryObjectLink: View {
//
//    var categoryName: String
//    var items: [AudioContent]
//
//    var body: some View {
//        NavigationLink(destination: SearchCategoryItem(categoryName: categoryName, items: self.items
//        )) {
//            CategoryObject(CategoryRow(categoryName: audioContentData[0].category.rawValue,
//                     items: Array(audioContentData.prefix(4))
//            ))
//                .frame(width: 190, height: 60)
//                .background(Color(red: 38/255, green: 39/255, blue: 10/255, opacity: 40/255))
//        }
//    }
//}

// MARK: - CategoryObjectLinkPreview
struct CategoryObject_Previews: PreviewProvider {
    static var previews: some View {
        CategoryObject(categoryName: audioContentData[0].category.rawValue,
                       items: Array(audioContentData.prefix(4)))
            .previewLayout(.fixed(width: 190, height: 60))
            .environmentObject(UserData())
        
    }
}


// MARK: - FavoritedObjectLink
struct FavoritedObjectLink: View {
    var body: some View {
        NavigationLink(destination: FavoritedView()) {
            HStack {
                Image(systemName: "heart")
                    .padding(.leading, 20.0)
                    .font(.system(size: 25.0, weight: .thin))
                    .foregroundColor(Color.red)
                
                Text("お気に入り")
                    .padding(.leading, 25.0)
                Spacer()
            }
            .frame(width: 190, height: 60)
            .background(Color(red: 38/255, green: 39/255, blue: 10/255, opacity: 40/255))
        }
    }
}

// MARK: - FavoritedObjectLinkPreView
struct FavoritedObjectLink_Previews: PreviewProvider {
    static var previews: some View {
        FavoritedObjectLink()
            .previewLayout(.fixed(width: 190, height: 60))
            .environmentObject(UserData())
    }
}

// MARK: - Future
struct Future: View {
    
    @EnvironmentObject private var userData: UserData
    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContentData,
            by: { $0.category.rawValue }
        )
    }
    //    var items: [AudioContent]
    
    var body: some View {
        VStack {
            FavoritedObjectLink()
            ForEach(categories.keys.sorted(), id: \.self) { key in
                CategoryObject(categoryName: key, items: self.categories[key]!)
            }
            //            HStack {
            //                //                ここだけはお気に入りに遷移できるようにする
            //                FavoritedObjectLink()
            //                Spacer()
            //                CategoryObject(categoryName: self.categoryName,
            //                                   items: self.items)
            //            }
            //            HStack {
            //                CategoryObject(categoryName: self.categoryName,
            //                                   items: self.items)
            //                Spacer()
            //                CategoryObject(categoryName: self.categoryName,
            //                                   items: self.items)
            //            }
            //            HStack {
            //                CategoryObject(categoryName: self.categoryName,
            //                                   items: self.items)
            //                Spacer()
            //                CategoryObject(categoryName: self.categoryName,
            //                                   items: self.items)
            //            }
            
        }
        .frame(width: 300, height: 250)
        .environmentObject(UserData())
        
    }
}

// MARK: - FutureView
struct Future_Previews: PreviewProvider {
    static var previews: some View {
        Future()
            .environmentObject(UserData())
    }
}
