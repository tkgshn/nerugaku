//
//  DataCollection.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 9/10/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import HealthKit

struct DataCollection: View {
    // @Stateを使ってUIの状態と同期をとる
    @State var labelText = "Tap Here"
    @State var flag = false
    var body: some View {

        // 縦にViewを並べる
        VStack() {
            Text(labelText)
                .font(.largeTitle)
                .padding(.bottom)
            // ボタンの作成(フラグを使って表示されるテキストを変える)
            Button(action: {
                //
                if(self.flag){
                    self.labelText = "Get Data"
                    self.flag = false
                }else{
                    // ボタンがタップされた時
                    self.labelText = "Succeeded!"
                    self.flag = true

                }}){
                    // ボタンのテキスト
                    Text("Button")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
            }
            .padding(.all)
            .background(Color.blue)
        }
    }
}
// インスタンスの生成
struct DataCollection_Previews: PreviewProvider {
    static var previews: some View {
        DataCollection()
    }
}
