////
////  PeopleView.swift
////  nerugaku1
////
////  Created by Shunsuke Takagi on 2020/08/06.
////  Copyright © 2020 Shunsuke Takagi. All rights reserved.
////
//
//import SwiftUI
//import QGrid
//
//struct PeopleView: View {
//    var items: [AudioContent]
//
//    var body: some View {
//        QGrid(self.items, columns: 2) { GridCell(audioContent: $0) }
//    }
//}
//
//struct GridCell: View {
//    //    var person: Person
//    var audioContent: AudioContent
//
//    var body: some View {
//        HStack {
//            //            ここに画像
//            audioContent.image
//                .renderingMode(.original)
//                .resizable()
//                .frame(width: 50, height: 50)
//            //        ここにデータベースから引っ張ってきた名前を入れる
//            Text(audioContent.name)
//                .font(.headline)
//                .fontWeight(.bold)
//                .foregroundColor(Color.black)
//                .multilineTextAlignment(.leading)
//
//            Spacer()
//        }
//    }
//}
//
//struct PeopleView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeopleView(items: Array(audioContetsData.prefix(10)))
//    }
//}
