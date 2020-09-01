//
//  Contents.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/30.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

//ここでAudioContent自体を定義する
struct AudioContent: Hashable, Codable, Identifiable {
    //    コンテンツのid
    var id: Int
    //    コンテンツのタイトル
    var name: String
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
//    入れ子（ネスト）になる
    var category: Category
    //    お気に入りかどうか
    var isFavorite: Bool
    //    おすすめかどうか
    var isFeatured: Bool
    
    //    音声コンテンツのURL
    var url: String
    
    
    //    サムネイル画像
    fileprivate var imageName: String
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(name))
    }
    
//    音声ファイルを読み取るために追加する
    fileprivate var audioName: String
    
    
    
    //    Category自体を詳細記入
//    ここでネストの中を書く
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "おすすめ"
        case studyabord = "留学"
        case vacation = "旅行"
        case  dailylife = "日常生活"
    }
}

extension AudioContent {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}


#if DEBUG
extension AudioContent {
    /// Used to create a Post for example Debug purposes
    static var example: Self {
        return AudioContent(id: 0,
                            name: "Test name",
                            description: "Test disctiption",
                            allfavorite: 10,
                            alltime: 156,
                            allphrase: 15,
                            phrase1: "This is a test sentence",
                            category: AudioContent.Category(rawValue: "おすすめ")!,
                            isFavorite: true,
                            isFeatured: true,
                            url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
                            imageName: "silversalmoncreek", audioName: "人称")
    }
}
#endif



