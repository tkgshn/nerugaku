//
//  TabEView YouView.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/24.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct YouView: View {
    
    @State var showingProfile = false
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
                VStack {
                    //                    縦軸は上から高い順に、dataに入っている数を使うっぽい
                    //                    この例なら、54.00が一番大きく・7.00が一番小さい
                    LineView(data: [8,23,54,32,12,37,7,23,43], legend: "睡眠記録")
                        .padding([.leading, .bottom, .trailing], 20.0)
                    
                    Group {
                        HStack{
                            PieChartView(data: [8,23,54,32], title: "学習済みカテゴリーの割合", dropShadow: false)
                            Spacer()
                            BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "今週の勉強時間", form: ChartForm.medium, dropShadow: false)
                        }
                    }
                    .padding(.top, 300.0)
                    .padding([.leading, .bottom, .trailing], 20.0)
                    
                    Group {
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0.5)
                                .frame(width: nil, height: 80.0)
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0.5)
                                .frame(width: nil, height: 80.0)
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0.5)
                                .frame(width: nil, height: 80.0)
                            
                        }
                    }
                    .padding([.leading, .bottom, .trailing], 20.0)
                }
            }
            .navigationBarTitle(Text("You"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}


struct YouView_Previews: PreviewProvider {
    static var previews: some View {
        YouView()
    }
}



