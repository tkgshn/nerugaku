//
//  PlayerTestView.swift
//  AVPlayer-SwiftUI
//
//  Created by Chris Mash on 08/03/2020.
//  Copyright © 2020 Chris Mash. All rights reserved.
//

import SwiftUI
import AVFoundation

struct AudioPlayerControlsView2: View {
    private enum PlaybackState: Int {
        case waitingForSelection
        case buffering
        case playing
    }
    
    let player: AVPlayer
    let timeObserver: PlayerTimeObserver2
    let durationObserver: PlayerDurationObserver2
    let itemObserver: PlayerItemObserver2
    @State private var currentTime: TimeInterval = 0
    @State private var currentDuration: TimeInterval = 0
    @State private var state = PlaybackState.waitingForSelection
    
    var body: some View {
        VStack {
            if state == .waitingForSelection {
                Text("Select a song below")
            } else if state == .buffering {
                Text("Buffering...")
            } else {
                Text("Great choice!")
            }
            
            Slider(value: $currentTime,
                   in: 0...currentDuration,
                   onEditingChanged: sliderEditingChanged,
                   minimumValueLabel: Text("\(Utility.formatSecondsToHMS(currentTime))"),
                   maximumValueLabel: Text("\(Utility.formatSecondsToHMS(currentDuration))")) {
                    // I have no idea in what scenario this View is shown...
                    Text("seek/progress slider")
            }
            .disabled(state != .playing)
        }
        .padding()
            // Listen out for the time observer publishing changes to the player's time
            .onReceive(timeObserver.publisher) { time in
                // Update the local var
                self.currentTime = time
                // And flag that we've started playback
                if time > 0 {
                    self.state = .playing
                }
        }
            // Listen out for the duration observer publishing changes to the player's item duration
            .onReceive(durationObserver.publisher) { duration in
                // Update the local var
                self.currentDuration = duration
        }
            // Listen out for the item observer publishing a change to whether the player has an item
            .onReceive(itemObserver.publisher) { hasItem in
                self.state = hasItem ? .buffering : .waitingForSelection
                self.currentTime = 0
                self.currentDuration = 0
        }
        // TODO the below could replace the above but causes a crash
        //        // Listen out for the player's item changing
        //        .onReceive(player.publisher(for: \.currentItem)) { item in
        //            self.state = item != nil ? .buffering : .waitingForSelection
        //            self.currentTime = 0
        //            self.currentDuration = 0
        //        }
    }
    
    // MARK: Private functions
    private func sliderEditingChanged(editingStarted: Bool) {
        if editingStarted {
            // Tell the PlayerTimeObserver to stop publishing updates while the user is interacting
            // with the slider (otherwise it would keep jumping from where they've moved it to, back
            // to where the player is currently at)
            timeObserver.pause(true)
        }
        else {
            // Editing finished, start the seek
            state = .buffering
            let targetTime = CMTime(seconds: currentTime,
                                    preferredTimescale: 600)
            player.seek(to: targetTime) { _ in
                // Now the (async) seek is completed, resume normal operation
                self.timeObserver.pause(false)
                self.state = .playing
            }
        }
    }
}

struct PlayerTestView: View {
    
    let player = AVPlayer()
    @State private var playerPaused = false
    //    コンテンツ自体をインポート
    var audioContent: AudioContent
    //    再生速度関連
    @State var spChanger:Float = 1.0
    @State var spString:String = "1.0"
    @State var meterBool = true
    
    var currentAudioIndex = 0
    var audioList:NSArray!
    
    private let items = [(url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
                          title: "Song-1"),
                         (url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
                          title: "Song-2")]
    
    var body: some View {
        VStack {
            AudioPlayerControlsView2(player: player,
                                     timeObserver: PlayerTimeObserver2(player: player),
                                     durationObserver: PlayerDurationObserver2(player: player),
                                     itemObserver: PlayerItemObserver2(player: player))
            
            
            HStack {
                Spacer()
                
                //                再生・一時停止のやつ
                Button(action: togglePlayPause) {
                    Image(systemName: playerPaused ? "play" : "pause")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
//                Button(action: playNextAudio) {
//                    Image(systemName: "play")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fit)
//
//                }
                
            }
        }
        .onDisappear {
            // When this View isn't being shown anymore stop the player
            self.player.replaceCurrentItem(with: nil)
        }
    }
    
    // MARK:- 音声再生まわり(その1)
    
//    mutating func test() {
//        currentAudioIndex = (NSIndexPath).row
//    }
    
    //    再生ボタンを状態に応じて変更する その1
    
    private func togglePlayPause() {
        pausePlayer(!playerPaused)
    }
    //    再生ボタンを状態に応じて変更する その2
    private func pausePlayer(_ pause: Bool) {
        playerPaused = pause
        if playerPaused {
            player.pause()
        }
            
        else {
            player.play()
        }
    }
    
    //MARK:- 音声再生まわり(その2)
    
//     func playNextAudio(){
//        currentAudioIndex += 1
//        if currentAudioIndex>audioList.count-1{
//            currentAudioIndex -= 1
//
//            return
//        }
//        if playerPaused == false{
//            guard let url = URL(string: self.audioContent.url)
//                else {
//                    return
//            }
//            let playerItem = AVPlayerItem(url: url)
//            self.player.replaceCurrentItem(with: playerItem)
//            self.player.play()
//        }else{
//            guard let url = URL(string: self.audioContent.url)
//                else {
//                    return
//            }
//            let playerItem = AVPlayerItem(url: url)
//            self.player.replaceCurrentItem(with: playerItem)
//        }
//
//    }
    
    
//     func playPreviousAudio(){
//        currentAudioIndex -= 1
//        if currentAudioIndex<0{
//            currentAudioIndex += 1
//            return
//        }
//        if playerPaused == false{
//            guard let url = URL(string: self.audioContent.url)
//                else {
//                    return
//            }
//            let playerItem = AVPlayerItem(url: url)
//            self.player.replaceCurrentItem(with: playerItem)
//            self.player.play()
//        }else{
//            guard let url = URL(string: self.audioContent.url)
//                else {
//                    return
//            }
//            let playerItem = AVPlayerItem(url: url)
//            self.player.replaceCurrentItem(with: playerItem)
//        }
//
//    }
    
}

import Combine
class PlayerTimeObserver2 {
    let publisher = PassthroughSubject<TimeInterval, Never>()
    private weak var player: AVPlayer?
    private var timeObservation: Any?
    private var paused = false
    
    init(player: AVPlayer) {
        self.player = player
        
        // Periodically observe the player's current time, whilst playing
        timeObservation = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: nil) { [weak self] time in
            guard let self = self else { return }
            // If we've not been told to pause our updates
            guard !self.paused else { return }
            // Publish the new player time
            self.publisher.send(time.seconds)
        }
    }
    
    deinit {
        if let player = player,
            let observer = timeObservation {
            player.removeTimeObserver(observer)
        }
    }
    
    func pause(_ pause: Bool) {
        paused = pause
    }
}

class PlayerItemObserver2 {
    let publisher = PassthroughSubject<Bool, Never>()
    private var itemObservation: NSKeyValueObservation?
    
    init(player: AVPlayer) {
        // Observe the current item changing
        itemObservation = player.observe(\.currentItem) { [weak self] player, change in
            guard let self = self else { return }
            // Publish whether the player has an item or not
            self.publisher.send(player.currentItem != nil)
        }
    }
    
    
    
    deinit {
        if let observer = itemObservation {
            observer.invalidate()
        }
    }
}

class PlayerDurationObserver2 {
    let publisher = PassthroughSubject<TimeInterval, Never>()
    private var cancellable: AnyCancellable?
    
    init(player: AVPlayer) {
        let durationKeyPath: KeyPath<AVPlayer, CMTime?> = \.currentItem?.duration
        cancellable = player.publisher(for: durationKeyPath).sink { duration in
            guard let duration = duration else { return }
            guard duration.isNumeric else { return }
            self.publisher.send(duration.seconds)
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
