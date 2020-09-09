


import SwiftUI

//ここでAudioContent自体を定義する
struct AudioContent:   Codable, Identifiable {
    
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
    //    コンテンツのカテゴリー
    var category: Category //    入れ子（ネスト）になる
    //    お気に入りかどうか
    var isFavorite: Bool
    //    おすすめかどうか
    var isFeatured: Bool

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
//    fileprivate
    var contentAudioName: String

    // フレーズの入れ子を作る
    var phrases: [String: Phrase]
    


    //    Category自体を詳細記入
//    ここでネストの中を書く
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "おすすめ"
        case studyabord = "留学"
        case vacation = "旅行"
        case dailylife = "日常生活"
    }
}
// MARK: - extension
extension AudioContent {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

// MARK: - Phrase
struct Phrase: Codable {
    var japanese: String
    var english: String
//    fileprivate
    var phraseAudioName: String

}


