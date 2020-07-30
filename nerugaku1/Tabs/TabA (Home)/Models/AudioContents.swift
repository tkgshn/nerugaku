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
    var id: Int
    var name: String
    var description: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    
    
    //    Category自体を詳細記入
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

#if DEBUG
extension AudioContents {
    /// Used to create a Post for example Debug purposes
    static var example: Self {
        return AudioContents(id: 0, name: "hello-world", description: "this is a disctiption", category: AudioContents.Category(rawValue: "Lakes")!, isFavorite: true, isFeatured: true)
    }
}
#endif



