//
//  Contents.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/30.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

//ここでAudioContents自体を定義する
struct AudioContents: Hashable, Codable, Identifiable {
    //    コンテンツの🆔
    var id: Int
    //    コンテンツのタイトル
    var title: String
    //    コンテンツの概要
    var description: String
//    いいねの総数
    var allfavorite: Int
//    再生するのにかかる時間（分）
    var alltime: Int
    //    総フレーズ数
    var allphrase: Int
    //    フレーズ1
    var phrase1: String
    //    コンテンツのカテゴリー
    var category: Category
    //    お気に入りかどうか
    var isFavorite: Bool
    //    おすすめかどうか
    var isFeatured: Bool
    
    
    
    //    Category自体を詳細記入
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "おすすめ"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

#if DEBUG
extension AudioContents {
    /// Used to create a Post for example Debug purposes
    static var example: Self {
        return AudioContents(id: 0,
                             title: "Test title",
                             description: "Test disctiption",
                             allfavorite: 10,
                             alltime: 156,
                             allphrase: 15,
                             phrase1: "This is a test sentence",
                             category: AudioContents.Category(rawValue: "おすすめ")!,
                             isFavorite: true,
                             isFeatured: true)
    }
}
#endif



