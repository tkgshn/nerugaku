////
////  MediaContentView.swift
////  SpotifyWithSwiftUI
////
////  Created by Archie Edwards on 31/05/2020.
////  Copyright © 2020 Archie Edwards. All rights reserved.
////
//
//import SwiftUI
//
//struct MediaContentView: View {
//
//    //    var subCategorys : [String]
//    //        下の要素で使う項目をインポート
//    @Binding var currentSubCategoryIndex : Int
////    @Binding var indicatorOffset : CGFloat
//    //    いいね履歴等のユーザーデータを取得
//    @EnvironmentObject private var userData: UserData
//
//    //    このオブジェクトの子に当たるListObejectの要素を補填する
//    //    しなくていいかも
//    //    var ListObject : [String]
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: true){
//            ForEach(userData.audioContents) { audioContent in
//                //             いいねしてるかの処理
//                //                クリックしている場合はいいねをしているもののみを表示
//                //                if !self.userData.showFavoritesOnly || audioContent.isFavorite {NavigationLink(destination: AudioContentDetail(audioContent: audioContent)) {
//                if self.currentSubCategoryIndex == 0 {
//                    ListObjectAll(parent: self, audioContent: audioContent)
//                } else if self.currentSubCategoryIndex == 1 {
//                    Text("self.currentSubCategoryIndex == 1")
//                } else {
//                    Text("none")
//                }
//            }
//            //                }
//            //            }
//        }.padding(.leading)
//    } //    とりあえずここで修了
//
//    //    さっき上に出てきたsubCategoryの概念を制作している
//    //    全部のListObbjec（いいねあり・なし関係なし）
//    struct ListObjectAll: View{
//
//        //        var colours : [Color] = [.red, .orange, .green, .pink, .purple, .yellow]
//
//        //        indexを定義する
//        //        var index: Int
//        //        このオブジェクト自体の親を決定する
//        var parent: MediaContentView
//
//        var audioContent: AudioContent
//
//
//
//        var body: some View{
//            //            ここから中身
//            HStack {
//                audioContent.image
//                    .renderingMode(.original)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                Text(audioContent.name)
//                Spacer()
//
//                //            いいねしてた場合
//                if audioContent.isFavorite {
//                    Image("Heart.fill")
//                        .imageScale(.medium)
//                        .foregroundColor(.red)
//                }
//            }
//            //                        HStack{
//            //                            Rectangle()
//            //                                .frame(width: UIScreen.main.bounds.size.width/6 , height: UIScreen.main.bounds.size.height/12)
//            //            //                    色は5つの中からランダムに取得する
//            //                                .foregroundColor(self.colours[Int.random(in: 0 ... 5 )])
//            //                            VStack(alignment: .leading){
//            //                                Text("Insert Media").font(.headline).fixedSize(horizontal: true, vertical: false)
//            //                                Text("by 1").font(.footnote).bold().foregroundColor(.secondary).fixedSize(horizontal: true, vertical: false)
//            //                            }
//            //                            Spacer()
//            //                        }
//            //                    「今表示している場所（parent.currentSubCategoryIndex）」が「自分が割り振られた数字（index）」と一致している場合
//            //            if self.parent.currentSubCategoryIndex == 0 {
//            //                HStack {
//            //                    audioContent.image
//            //                        .renderingMode(.original)
//            //                        .resizable()
//            //                        .frame(width: 50, height: 50)
//            //                    Text(audioContent.name)
//            //                    Spacer()
//            //
//            //                    //            いいねしてた場合
//            //                    if audioContent.isFavorite {
//            //
//            //                        Image("Heart.fill")
//            //                            .imageScale(.medium)
//            //                            .foregroundColor(.red)
//            //                    }
//            //                }
//            //            } else {
//            ////              例外処理
//            //                HStack {
//            //                    audioContent.image
//            //                        .renderingMode(.original)
//            //                        .resizable()
//            //                        .frame(width: 50, height: 50)
//            //                    Text(audioContent.name)
//            //                    Spacer()
//            //
//            //                    //            いいねしてた場合
//            //                    if audioContent.isFavorite {
//            //
//            //                        Image("Heart.fill")
//            //                            .imageScale(.medium)
//            //                            .foregroundColor(.red)
//            //                    }
//            //                }
//            //
//            //            }
//        }
//    }
//
//    //    いいねしたやつだけを抽出する
//    struct ListObjectFavorited: View{
//
//        @EnvironmentObject private var userData: UserData
//        //        var colours : [Color] = [.red, .orange, .green, .pink, .purple, .yellow]
//
//        //        indexを定義する
//        //        var index: Int
//        //        このオブジェクト自体の親を決定する
//        var parent: MediaContentView
//
//        var audioContent: AudioContent
//
//        //        すでにこのViewではいいねされていることにする
//        //        var isOn: $userData.showFavoritesOnly
//
//
//
//        var body: some View{
//            //            ここから中身
//
//            HStack {
//                audioContent.image
//                    .renderingMode(.original)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                Text(audioContent.name)
//                Spacer()
//
//                //            いいねしてた場合
//                if audioContent.isFavorite {
//                    Image("Heart.fill")
//                        .imageScale(.medium)
//                        .foregroundColor(.red)
//                }
//            }
//            //                        HStack{
//            //                            Rectangle()
//            //                                .frame(width: UIScreen.main.bounds.size.width/6 , height: UIScreen.main.bounds.size.height/12)
//            //            //                    色は5つの中からランダムに取得する
//            //                                .foregroundColor(self.colours[Int.random(in: 0 ... 5 )])
//            //                            VStack(alignment: .leading){
//            //                                Text("Insert Media").font(.headline).fixedSize(horizontal: true, vertical: false)
//            //                                Text("by 1").font(.footnote).bold().foregroundColor(.secondary).fixedSize(horizontal: true, vertical: false)
//            //                            }
//            //                            Spacer()
//            //                        }
//            //                    「今表示している場所（parent.currentSubCategoryIndex）」が「自分が割り振られた数字（index）」と一致している場合
//            //            if self.parent.currentSubCategoryIndex == 0 {
//            //                HStack {
//            //                    audioContent.image
//            //                        .renderingMode(.original)
//            //                        .resizable()
//            //                        .frame(width: 50, height: 50)
//            //                    Text(audioContent.name)
//            //                    Spacer()
//            //
//            //                    //            いいねしてた場合
//            //                    if audioContent.isFavorite {
//            //
//            //                        Image("Heart.fill")
//            //                            .imageScale(.medium)
//            //                            .foregroundColor(.red)
//            //                    }
//            //                }
//            //            } else {
//            ////              例外処理
//            //                HStack {
//            //                    audioContent.image
//            //                        .renderingMode(.original)
//            //                        .resizable()
//            //                        .frame(width: 50, height: 50)
//            //                    Text(audioContent.name)
//            //                    Spacer()
//            //
//            //                    //            いいねしてた場合
//            //                    if audioContent.isFavorite {
//            //
//            //                        Image("Heart.fill")
//            //                            .imageScale(.medium)
//            //                            .foregroundColor(.red)
//            //                    }
//            //                }
//            //
//            //            }
//        }
//    }
//}
//
//
//struct MediaContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaContentViewPreview()
//    }
//    struct MediaContentViewPreview : View{
//        @State var currentSubCategoryIndex = 0
////        @State var indicatorOffset: CGFloat = 0
//        var body: some View{
//            MediaContentView(currentSubCategoryIndex: self.$currentSubCategoryIndex)
//                .environmentObject(UserData())
//        }
//    }
//}
//
//
////struct MediaContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        MediaContentView()
////            .environmentObject(UserData())
////
////    }
////}
//
