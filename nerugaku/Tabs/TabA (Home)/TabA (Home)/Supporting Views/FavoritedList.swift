//
//  Favorited.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 9/11/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct FavoritedList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            ForEach(audioContentData) { audioContent in
                if  audioContent.isFavorite {
                    NavigationLink(
                        destination: AudioContentDetail(audioContent: audioContent)
                    ) {
                        AudioContentRow(audioContent: audioContent)
                    }
                }
            }
        }
        .environmentObject(UserData())
    }
}

struct FavoritedList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            NavigationView {
                FavoritedList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
        .environmentObject(UserData())
    }
}
