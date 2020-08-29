//
//  TabE.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct TabEView: View {
    
//    @State private var selectedTab = 1
//    @State var data1: [Double] = (0..<16).map { _ in .random(in: 9.0...100.0) }
//    @State var data2: [Double] = (0..<16).map { _ in .random(in: 9.0...100.0) }
//    @State var data3: [Double] = (0..<12).map { _ in .random(in: 9.0...100.0) }
//    @State var data4: [Double] = (0..<8) .map { _ in .random(in: 1.0...125.0) }
//    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
//        ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark),
//        ColorGradient(.purple, .blue)
//    ])
//    let blueStyle = ChartStyle(backgroundColor: .white,
//                               foregroundColor: [ColorGradient(.purple, .blue)])
//    let orangeStyle = ChartStyle(backgroundColor: .white,
//                                 foregroundColor: [ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark)])
//    let multiStyle = ChartStyle(backgroundColor: Color.green.opacity(0.2),
//                                foregroundColor:
//                                    [ColorGradient(.purple, .blue),
//                                     ColorGradient(.orange, .red),
//                                     ColorGradient(.green, .yellow),
//                                     ColorGradient(.red, .purple),
//                                     ColorGradient(.yellow, .orange),
//                                    ])
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HeaderView(title: "Today")
//            CardView(showShadow: true) {
//                ChartLabel("Line Chart", type: .subTitle)
//                LineChart()
//            }
//            .data(data1)
//            .chartStyle(blueStyle)
//            .padding()
        }
    }
}


struct TabEView_Previews: PreviewProvider {
    static var previews: some View {
        TabEView()
    }
}



struct HeaderView: View {
    let title: String
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("12月22日 日曜日")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(16)
                Spacer()
            }.frame(height: 16, alignment: .topLeading)
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(16)
                Spacer()
                Image("avator")
                    .resizable() // 画像のサイズを変更可能にする
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36, alignment: .center)
                    .clipShape(Circle()) // 正円形に切り抜く
                    .padding(.trailing, 16)
            }
        }
    }
}
