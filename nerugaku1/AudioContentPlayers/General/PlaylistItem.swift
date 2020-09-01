//
//  PlaylistItem.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 8/28/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

//追加

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Struct `PlaylistItem` is a playable track as an item in a playlist.
*/

import AVFoundation

struct PlaylistItem {
    
    /// URL of the local file containing the track's audio.
    let url: URL!
    
    /// An error that prevents the track from playing.
    let error: Error?
    
    /// The title of the track.
    let title: String
    
    /// The artist heard on the track.
    let artist: String
    
    /// The duration of the audio file.
    let duration: CMTime
    
    /// Initializes a valid item.
    init(url: URL, title: String, artist: String, duration: CMTime) {
        self.url = url
        self.title = title
        self.artist = artist
        self.duration = duration
        self.error = nil
    }
    
    /// Initializes an invalid item.
    init(title: String, artist: String, error: Error) {
        self.url = nil
        self.title = title
        self.artist = artist
        self.duration = .zero
        self.error = error
    }
    
    /// Initializes a placeholder item.
    init(title: String, artist: String) {
        self.url = nil
        self.title = title
        self.artist = artist
        self.duration = .zero
        self.error = nil
    }
}

