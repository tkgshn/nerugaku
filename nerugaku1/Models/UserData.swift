//
//  UserData.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/30.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//
import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = true
    @Published var audioContents = audioContentData
//    @Published var phrases = phraseData
}
