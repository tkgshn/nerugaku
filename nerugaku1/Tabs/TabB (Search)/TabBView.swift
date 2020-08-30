//
//  TabBView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/22.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct TabBView: View {

    var categories: [String: [AudioContent]] {
        Dictionary(
            grouping: audioContetsData,
            by: { $0.category.rawValue }
        )
    }
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                    if showCancelButton  {
                        Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
                
                List {
                    // Filtered list of names
                    
                    ForEach(categories.keys.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) { searchText in
                        NavigationLink(
                            destination: SearchCategoryItem(categoryName: searchText, items: self.categories[searchText]!)
                                .environmentObject(UserData())
                            
                        ) {
                            Text(searchText)
                        }
                    }
                }
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
                .environmentObject(UserData())
            }
        }
    }
}



struct TabBView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBView()
                .environment(\.colorScheme, .light)
            
            TabBView()
                .environment(\.colorScheme, .dark)
        }
    }
}

//ここでカテゴリーの表示を定義する
//struct SearchCategoryItem: View {
//    var categories: [String: [AudioContent]] {
//        Dictionary(
//            grouping: audioContetsData,
//            by: { $0.category.rawValue }
//        )
//    }
//    var body: some View {
////        カテゴリ名をクリックすると、カテゴリーの詳細に遷移する
//        NavigationLink(
//            destination: CategoryDetial()
//        ) {
//            Text(self.categories)
//                .font(.headline)
//                .padding(.leading, 15)
//                .padding(.top, 5)
//        }
//    }
//}
//
////カテゴリーの詳細
//struct CategoryDetial: View {
//    var audioContent: AudioContent
//    var items: [AudioContent]
//    var categoryName: String
//    var body: some View {
//        HStack {
//            Text(self.categoryName)
//            ForEach(self.items) { audioContent in
////                        それをクリックできるようにする
//                NavigationLink(
//                    destination: AudioContentDetail(
//                        audioContent: audioContent
//                    )
//                ) {
////                            下で定義したものを使用
//                    AudioContentRow(audioContent: audioContent)
//                }
//            }
//        }
//    }
//}

struct SearchCategoryItem: View {
    var categoryName: String
    var items: [AudioContent]
    @EnvironmentObject var userData: UserData
    
    var body: some View {
//        縦方向
        List {
//        VStack(alignment: .leading) {
////            まずはカテゴリーを表示する
//            Text(self.categoryName)
//                .font(.headline)
//                .padding(.leading, 15)
//                .padding(.top, 5)
//            横向きにスクロールを追加
//            ScrollView(.horizontal, showsIndicators: false) {
//                横方向
//                HStack(alignment: .top, spacing: 0) {
//                    アイテムがあるかぎり繰り返す
//        List {
                    ForEach(self.items) { audioContent in
//                        それをクリックできるようにする
                        NavigationLink(
                            destination: AudioContentDetail(
                                audioContent: audioContent
                            )
                        ) {
                            AudioContentRow(audioContent: audioContent)
                            
                        }
                    }
                }.navigationBarTitle(Text(self.categoryName), displayMode: .inline)
//            }
//            .frame(height: 185)
//        }
    }
}



extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}


