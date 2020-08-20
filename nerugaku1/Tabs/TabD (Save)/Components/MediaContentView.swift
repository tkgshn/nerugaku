//
//  MediaContentView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/28.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI


struct MediaContentView: View {
//    @EnvironmentObject var userData: UserData
    @EnvironmentObject private var userData: UserData
    
    @Binding var currentSubCategoryIndex : Int
//    @Binding var currentCategoryIndex : Int
//    @Binding var nestedPages : [Int]
    var body: some View {
        //        NavigationView {
        List {
//            ボタンを押すことで、showFavoritesOnlyにする
            Toggle(isOn: $userData.showFavoritesOnly) {
            Text("Show Favorites Only")
            }
//            
////            showFavoritesOnlyではない場合はNoを表示
//
//            if self.currentSubCategoryIndex == 0 {
//                Text("1")
//                ForEach(userData.audiocontents) { audioContent in
//                    NavigationLink(destination: Detail(audioContent: audioContent)) {
//                        ContentRow(audioContent: audioContent)
//                    }
//                }
//            } else {
////                showFavoritesOnlyな場合はYesを表示
//                Text("2")
//            }
////

                ForEach(userData.audiocontents) { audioContent in
                    if !self.userData.showFavoritesOnly || audioContent.isFavorite {
                        NavigationLink(
                            destination: Detail(audioContent: audioContent)
                        ) {
                            ContentRow(audioContent: audioContent)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
    }
}




struct MediaContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContentViewPreview()
    }
    struct MediaContentViewPreview: View {
//        @State var currentCategoryIndex = 0
        @State var currentSubCategoryIndex = 0
        var body: some View{
            ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            NavigationView {
                MediaContentView(currentSubCategoryIndex: self.$currentSubCategoryIndex)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            }
        }
            .environmentObject(UserData())
    }
    }
}

