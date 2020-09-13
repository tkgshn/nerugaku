//
//  AudioContentList.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 9/11/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct AudioContentList: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
        List {
            ForEach(audioContentData) { audioContent in
                
                NavigationLink(
                    destination: AudioContentDetail(audioContent: audioContent)
                ) {
                    AudioContentRow(audioContent: audioContent)
                }
                
            }
        }
        .environmentObject(UserData())
    }
}

struct AudioContentList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            NavigationView {
                AudioContentList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
        .environmentObject(UserData())
    }
}

