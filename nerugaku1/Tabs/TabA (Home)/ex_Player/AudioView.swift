//
//  AudioView.swift
//  AVPlayer-SwiftUI
//
//  Created by Chris Mash on 08/03/2020.
//  Copyright © 2020 Chris Mash. All rights reserved.
//

import SwiftUI
import AVFoundation

struct AudioPlayerControlsView: View {
    
    //    再生ステータスを3つに分ける
    private enum PlaybackState: Int {
        case waitingForSelection
        case buffering
        case playing
    }
    
    let player: AVPlayer
    let timeObserver: PlayerTimeObserver
    let durationObserver: PlayerDurationObserver
    let itemObserver: PlayerItemObserver
    @State private var currentTime: TimeInterval = 0
    @State private var currentDuration: TimeInterval = 0
    //    　最初は選ばれるのを待っている状態だったのを
    
    //    最初の状態は再生されるの（選択される）を待っておく
    @State private var state = PlaybackState.waitingForSelection
    
    
    var body: some View {
        
        VStack {
            
            //            再生中のステータスによって表示をへんこう
            if state == .waitingForSelection {
                Text("Select a song below")
            } else if state == .buffering {
                Text("読み込んでいます...")
            } else {
                Text("再生中!")
            }
            
            
            Slider(value: $currentTime,
                   in: 0...currentDuration,
                   onEditingChanged: sliderEditingChanged,
                   //                   最小を定義
                minimumValueLabel: Text("\(Utility.formatSecondsToHMS(currentTime))"),
                //                   最高を定義
            maximumValueLabel: Text("\(Utility.formatSecondsToHMS(currentDuration))")) {
                // このビューがどのようなシナリオで表示されているのか、私にはさっぱりわかりません...。
                Text("seek/progress slider")
            }
            .padding([.top, .leading, .trailing])
                //            .disabled(state != .playing)から変更しようとしたけど意味なかったので同じ
                .disabled(state != .playing)
        }
        .padding(.top, 60.0)
            // タイムオブザーバーがプレイヤーの時間を変更して公開していることに耳を傾けてください。
            .onReceive(timeObserver.publisher) { time in
                // Update the local var
                self.currentTime = time
                // そして再生を開始したことをフラグ
                if time > 0 {
                    self.state = .playing
                }
        }
            // 持続時間オブザーバーがプレイヤーのアイテム持続時間の変更を公開していることに注意してください。
            .onReceive(durationObserver.publisher) { duration in
                // Uローカル変数の日付を変更する
                self.currentDuration = duration
        }
            // アイテムオブザーバーがプレイヤーがアイテムを持っているかどうかの変更を公開していることに注意してください。
            .onReceive(itemObserver.publisher) { hasItem in
                self.state = hasItem ? .buffering : .waitingForSelection
                self.currentTime = 0
                self.currentDuration = 0
        }
        
    }
    
    
    //    スライドをいじる場合
    // MARK: Private functions
    private func sliderEditingChanged(editingStarted: Bool) {
        if editingStarted {
            // ユーザーが対話している間、更新情報の公開を停止するようにPlayerTimeObserverに指示します。
            // スライダーを使って（そうしないと、スライダーを移動させたところからジャンプし続けてしまいます。
            // プレイヤーが現在いる場所に移動します)
            
            
            timeObserver.pause(true)
            
        }
        else {
            // 編集が終了し、シークを開始
            state = .buffering
            let targetTime = CMTime(seconds: currentTime,
                                    preferredTimescale: 600)
            player.seek(to: targetTime) { _ in
                // これで(非同期)シークが完了したので、通常の操作を再開します。
                self.timeObserver.pause(false)
                self.state = .playing
            }
        }
    }
}

struct AudioView: View {
    
    //    AVPlayer自体をインポート
    var player = AVPlayer()
    //    この再生が止まっているのかどうかを定義、下で開いた時に再生するように指定しているのでデフォルトを再生中に設定
    @State private var playerPaused = false
    //    コンテンツ自体をインポート
    var audioContent: AudioContent
    //    現在のファイルの位置を整理する
    var currentAudioIndex = 0
    
    
    
    
    //    再生速度関連
    @State var spChanger:Float = 1.0
    @State var spString:String = "1.0"
    @State var meterBool = true
    //    @State var currentTime = "0"
    
    //    アイテム類
//    private let items = [(url: ForEach {
//        audioContent.url
        //                        それをクリックできるようにする
            
//    }
//)]
    
    //    元々はここからロードしてた
    //    private let items = [(url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    //     title: "Song-1"),
    //    (url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    //     title: "Song-2")]
    
//    func ForEach() {
//        Text(audioContent.url)
//        //                        それをクリックできるようにする
//
//    }
    
    var body: some View {
        VStack {
            
            //            現在再生している音声の画像
            BackgroundImage(audioContent: audioContent)
            
            //            再生に関する操作
            AudioPlayerControlsView(player: player,
                                    timeObserver: PlayerTimeObserver(player: player),
                                    durationObserver: PlayerDurationObserver(player: player),
                                    itemObserver: PlayerItemObserver(player: player))
            
            
            
            
            
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
                
            }
            
            Spacer().frame(height:50)
            
            VStack {
                
                //                再生速度を変更
                Button(action:{
                    if self.spChanger == Float(1.0) {
                        self.spChanger = Float(2.0)
                        self.player.rate = self.spChanger
                        self.spString = "2"
                    } else if self.spChanger == Float(2.0) {
                        self.spChanger = Float(0.8)
                        self.player.rate = self.spChanger
                        self.spString = "0.8"
                    } else {
                        self.spChanger = Float(1.0)
                        self.player.rate = self.spChanger
                        self.spString = "1.0"
                    }
                }) {
                    //                    現在の再生しているスピードを表示
                    Text(spString + "x")
                }
            }.font(.title)
            
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
            
            
            //            このViewが表示されたら音声を再生する
            //            つまりクリック時に読み込みを開始する
            .onAppear {
                
                //                元々はこんな感じでローディングしてた
                //                guard let url = URL(string: item.url) else {
                //                    return
                //                }
                //                let playerItem = AVPlayerItem(url: url)
                //                self.player.replaceCurrentItem(with: playerItem)
                //                self.player.play()
                
                
                guard let url = URL(string: self.audioContent.url)
                    else {
                        return
                }
                let playerItem = AVPlayerItem(url: url)
                self.player.replaceCurrentItem(with: playerItem)
                self.player.play()
        }
        .onDisappear {
            // このビューが表示されなくなったら、プレイヤーを停止します。
            self.player.replaceCurrentItem(with: nil)
        }
    }
    
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
    
    //    次の曲を再生する関数
//    private func playNextAudio(){
//        guard let url = URL(string: self.audioContent.url + 1)
//            else {
//                return
//        }
//        let playerItem = AVPlayerItem(url: url)
//        self.player.replaceCurrentItem(with: playerItem)
//        self.player.play()
//    }
    
}









import Combine
class PlayerTimeObserver {
    let publisher = PassthroughSubject<TimeInterval, Never>()
    private weak var player: AVPlayer?
    private var timeObservation: Any?
    private var paused = false
    
    init(player: AVPlayer) {
        self.player = player
        
        
        // プレイ中のプレイヤーの現在時刻を定期的に監視する
        timeObservation = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: nil) { [weak self] time in
            guard let self = self else { return }
            // 更新を一時停止するように言われていない場合
            guard !self.paused else { return }
            // 新しいプレイヤーの時間を公開する
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

class PlayerItemObserver {
    let publisher = PassthroughSubject<Bool, Never>()
    private var itemObservation: NSKeyValueObservation?
    
    init(player: AVPlayer) {
        // 現在のアイテムの変化を監視する
        itemObservation = player.observe(\.currentItem) { [weak self] player, change in
            guard let self = self else { return }
            // プレイヤーがアイテムを持っているかどうかを公開する
            self.publisher.send(player.currentItem != nil)
        }
    }
    
    deinit {
        if let observer = itemObservation {
            observer.invalidate()
        }
    }
}

class PlayerDurationObserver {
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


extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
