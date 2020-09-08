//
//  Data.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/30.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

//フレームワークのインポート
import Foundation
import SwiftUI

let audioContentData: [AudioContent] = load("audioContentData.json")
let features = audioContentData.filter { $0.isFeatured }

//プロジェクトリソースのJSON形式データ（audioContentData.json）から[AudioContent]型のコレクションを返します
//Tを読み込む対象にしている
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

//    リソースからJSONデータを取得して定数 file に割り当て
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    guard-let 構文によって、早期エラー検出して安全に記述しています。
//    この後、do-try-catch エラーハンドリングをしながら、ファイル情報をデータ化します
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


final class ImageStore {
    //    変数 images は、_ImageDictionary 型と記述されていますが、実際には [String: CGImage] という辞書コレクションです
    //    filepribete キーワードによって、ファイル外からのアクセスが制限されています
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    //    変数 scale は、画像データを表示するときの倍率
    fileprivate static var scale = 2

    static var shared = ImageStore()

    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)

        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    //    プロジェクトに含まれている Resource フォルダ内にある画像を取得する
    static func loadImage(name: String) -> CGImage {
        guard
            //    パラメータとして受け取った画像名を使って、パスが割り当てられた定数 urlを生成
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            //    url を辿って、読み取る画像ソースを割り当てた定数 imageSource を生成
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            //    imageSourceの先頭インデックスに関連付けられた画像データを image に割り当てる
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        //        CGImage型の画像データを１つだけ返しています
        return image
    }

    //    画像名に基づいて辞書を検索し、対応する画像のインデックスを返す
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
//        if-let 構文によって、辞書コレクション内のキーに画像名が見つかった場合は、その index を返すようにしています
        if let index = images.index(forKey: name) { return index }
//        辞書でキーがヒットせず、nil になった場合は、パラメータ name と対応する画像データをResource フォルダから取得して、変数 images コレクションに追加します
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}

