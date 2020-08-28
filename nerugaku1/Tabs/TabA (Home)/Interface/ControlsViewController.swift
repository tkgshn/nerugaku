//
//  ControlsViewController.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 8/28/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

//追加

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
`ControlsViewController` controls the presentation of the playback UI controls,
 such as play/pause buttons, playback times, etc. It has a single child view controller
 of class `PlaylistViewController` which manages the playlist.
 
 ControlsViewController` は再生UIコントロールの表示を制御する。
 再生/一時停止ボタン、再生時間などのような それは単一の子ビューコントローラを持っています
 クラス `PlaylistViewController` のプレイリストを管理する。
*/

import UIKit
import AVKit
import CoreMedia
import AVFoundation
import MediaPlayer

class ControlsViewController: UIViewController, RemoteCommandHandler {
    
    // 様々なUIコントロールへの関連づけ.
    @IBOutlet private weak var rearrangeButton: UIButton!
    @IBOutlet private weak var restoreButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var titleView: UILabel!
    @IBOutlet private weak var artistView: UILabel!
    @IBOutlet private weak var currentTimeLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var timeSlider: UISlider!
    @IBOutlet private weak var playPauseButton: UIButton!
    @IBOutlet private weak var volumeViewContainer: UIView!
    @IBOutlet private weak var routePickerViewContainer: UIView!
    
    
    
    // サンプルバッファプレイヤー.
    let sampleBufferPlayer = SampleBufferPlayer()
    let session: AVAudioSession = AVAudioSession.sharedInstance()

    
    // プレイリストのテーブルビューを維持する子ビューコントローラ.
    private var playlistViewController: PlaylistViewController {
        
        guard let viewController = children.first as? PlaylistViewController
            else { fatalError("playlistViewController has not been set") }
        
        return viewController
    }
    
    // 私的通知オブザーバー.
    private var currentOffsetObserver: NSObjectProtocol!
    private var currentItemObserver: NSObjectProtocol!
    private var playbackRateObserver: NSObjectProtocol!
    
    // ビューとビューコントローラの設定.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 各種通知の監視.
//        正直あんまり理解してないけど、動作するのに必要らしい
        let notificationCenter = NotificationCenter.default
        
        currentOffsetObserver = notificationCenter.addObserver(forName: SampleBufferPlayer.currentOffsetDidChange,
                                                               object: sampleBufferPlayer,
                                                               queue: .main) { [unowned self] notification in
            
            let offset = (notification.userInfo? [SampleBufferPlayer.currentOffsetKey] as? NSValue)?.timeValue.seconds
            self.updateOffsetLabel(offset)
        }
        
        currentItemObserver = notificationCenter.addObserver(forName: SampleBufferPlayer.currentItemDidChange,
                                                             object: sampleBufferPlayer,
                                                             queue: .main) { [unowned self] _ in
            
            self.updateCurrentItemInfo()
        }
        
        playbackRateObserver = notificationCenter.addObserver(forName: SampleBufferPlayer.playbackRateDidChange,
                                                              object: sampleBufferPlayer,
                                                              queue: .main) { [unowned self] _ in
            
            self.updatePlayPauseButton()
            self.updateCurrentPlaybackInfo()
        }
        
        // ビューのコントロールを設定する.
        doneButton.alpha = 0
        
        updateOffsetLabel(0)
        updatePlayPauseButton()
        
        configureVolumeView()
        
        // Now Playing Info パネルの使用を開始します。.
        RemoteCommandCenter.handleRemoteCommands(using: self)
        
        // 初期設定で今再生中の情報を設定する.
        updateCurrentItemInfo()
    }
    
    // 再生/一時停止ボタンの状態を更新するヘルパーメソッド.
    private func updatePlayPauseButton() {
        
        let title = sampleBufferPlayer.isPlaying ? NSLocalizedString("停止", comment: "") : NSLocalizedString("再生", comment: "")
        
        playPauseButton.setTitle(title, for: .normal)
    }
    
    private static let format = NSLocalizedString("%.1f", comment: "")

    // 現在のプレイリスト項目内の経過時間を更新するヘルパーメソッド.
    private func updateOffsetLabel(_ offset: Double?) {
        
        // スクラビング中、ラベルはスライダの位置を表す代わりに.
        guard !isDraggingOffset else { return }
        
        // それ以外の場合は、何かが再生されているときにラベルとスライダーの位置を更新します。 ...
        if let currentOffset = offset {
            currentTimeLabel.text = String(format: ControlsViewController.format, currentOffset)
            timeSlider.value = Float(currentOffset)
        }
        
        // ... またはプレイヤーが停止しているとき。
        else {
            currentTimeLabel.text = ""
            timeSlider.value = 0
        }
    }
    
    // 項目が変更されたときに、現在のプレイリスト項目の固定情報を更新するヘルパーメソッド.
    private func updateCurrentItemInfo() {
        
        // Now Playing Infoを新しいアイテム情報に更新する.
        NowPlayingCenter.handleItemChange(item: sampleBufferPlayer.currentItem,
                                          index: sampleBufferPlayer.currentItemIndex ?? 0,
                                          count: sampleBufferPlayer.itemCount)

        // 何かが再生されているときにアイテム情報を更新する ...
        if let currentItem = sampleBufferPlayer.currentItem {
//            現在の再生位置
            let duration = currentItem.duration.seconds
            durationLabel.text = String(format: ControlsViewController.format, duration)
//            再生スライド関係
            timeSlider.isEnabled = true
            timeSlider.maximumValue = Float(duration)
//            アーティスト情報を更新する
            titleView.text = currentItem.title
            artistView.text = currentItem.artist
            
            // また、Now Playing Infoが更新されていることを確認してください。
            // 再生情報.
            updateCurrentPlaybackInfo()
        }
        
        // ... またはプレイヤーが停止しているとき.
        else {
            
            timeSlider.isEnabled = false
            timeSlider.value = 0.0
            currentTimeLabel.text = " "
            titleView.text = " "
            artistView.text = " "
            durationLabel.text = " "
        }
        
        // プレイリストの項目も更新するように伝える.
        playlistViewController.updateCurrentItem()
    }
    
    // Now Playing 再生情報を更新するヘルパーメソッド。.
    private func updateCurrentPlaybackInfo() {
        
        NowPlayingCenter.handlePlaybackChange(playing: sampleBufferPlayer.isPlaying,
                                              rate: sampleBufferPlayer.rate,
                                              position: sampleBufferPlayer.currentItemEndOffset?.seconds ?? 0,
                                              duration: sampleBufferPlayer.currentItem?.duration.seconds ?? 0)
    }
    
    // システムボリュームビューを追加および設定するヘルパーメソッドです。
    // ボリュームビューにルート選択ボタンを提供できることに注意してください。
    // しかし、そのアイコンは明るい背景ではうまく表示されません。
    // そのボタンは隠されていて、AVRoutePickerViewのインスタンス
    // 代わりに表示されます。
    private func configureVolumeView() {
        
        let volumeView = MPVolumeView(frame: volumeViewContainer.bounds)
        volumeView.showsRouteButton = false
        
        volumeViewContainer.addSubview(volumeView)
        volumeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            volumeViewContainer.topAnchor.constraint(equalTo: volumeView.topAnchor),
            volumeViewContainer.bottomAnchor.constraint(equalTo: volumeView.bottomAnchor),
            volumeViewContainer.leadingAnchor.constraint(equalTo: volumeView.leadingAnchor),
            volumeViewContainer.trailingAnchor.constraint(equalTo: volumeView.trailingAnchor)
        ])
        
        let routePickerView = AVRoutePickerView(frame: routePickerViewContainer.bounds)
        routePickerViewContainer.addSubview(routePickerView)
    }
    
    // リモートコマンドを実行します。.
    func performRemoteCommand(_ command: RemoteCommand) {
        
        switch command {
            
        case .pause:
            pause()
            
        case .play:
            play()
            
        case .nextTrack:
            nextTrack()
            
        case .previousTrack:
            previousTrack()
            
        case .skipForward(let distance):
            skip(by: distance)
            
        case .skipBackward(let distance):
            skip(by: -distance)

        case .changePlaybackPosition(let offset):
            skip(to: offset)
        }
    }
    
    // 時間オフセットスライダがドラッグされているときは 'true' です。
    private var isDraggingOffset: Bool = false
    
    // アクションメソッド：時間オフセットスライダのドラッグ開始、継続、停止.
    @IBAction func offsetDraggingDidStart() {
        isDraggingOffset = true
    }
    
    @IBAction func offsetDraggingDidDrag() {
        currentTimeLabel.text = String(format: ControlsViewController.format, timeSlider.value)
    }
    
    @IBAction func offsetDraggingDidEnd() {
        skip(to: TimeInterval(timeSlider.value))
        isDraggingOffset = false
    }
    
    // 再生を一時停止します。.
    @IBAction func pause() {
        sampleBufferPlayer.pause()
    }
    
    // 再生を開始または再開する.
    @IBAction func play() {
        sampleBufferPlayer.play()
    }
    
    @IBAction func togglePlayPause() {
        if sampleBufferPlayer.isPlaying {
            sampleBufferPlayer.pause()
        } else {
            sampleBufferPlayer.play()
        }
    }
    
    // 前のトラックへスキップ.
    @IBAction func previousTrack() {
        skipToCurrentItem(offsetBy: -1)
    }
    
    // 次のトラックへスキップ.
    @IBAction func nextTrack() {
        skipToCurrentItem(offsetBy: 1)
    }
    
    // 別のプレイリスト項目にスキップするヘルパーメソッド.
    private func skipToCurrentItem(offsetBy offset: Int) {
        
        guard let currentItemIndex = sampleBufferPlayer.currentItemIndex,
            sampleBufferPlayer.containsItem(at: currentItemIndex + offset)
            else { return }
        
        sampleBufferPlayer.seekToItem(at: currentItemIndex + offset)
    }
    
    // プレイリストのアイテムオフセットにスキップするヘルパーメソッドで、Now Playing Info を更新していることを確認してください。.
    private func skip(to offset: TimeInterval) {
        
        sampleBufferPlayer.seekToOffset(CMTime(seconds: Double(offset), preferredTimescale: 10))
        updateCurrentPlaybackInfo()
    }
    
    // 現在のアイテムで指定した距離をスキップするヘルパーメソッドで、Now Playing Info を更新していることを確認します。.
    private func skip(by distance: TimeInterval) {
        
        guard let offset = sampleBufferPlayer.currentItemEndOffset else { return }
        
        sampleBufferPlayer.seekToOffset(offset + CMTime(seconds: distance, preferredTimescale: 10))
        updateCurrentPlaybackInfo()
    }
    
    // プレイリストの再編成を開始します。.
    @IBAction func rearrangePlaylist() {

        // プレイリストビューコントローラにそれを行うように指示する.
        playlistViewController.rearrangePlaylist()
        
        // 短いアニメーションでボタンの構成を変更する.
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
            self.doneButton.alpha = 1
            self.rearrangeButton.alpha = 0
            self.restoreButton.alpha = 0
        })
    }
    
    // プレイリストの並べ替えを停止します。.
    @IBAction func doneWithPlaylist() {
        // プレイリストビューコントローラにそれを行うように指示する.
        playlistViewController.doneWithPlaylist()
        
        // ボタンの設定を短いアニメーションで変更する.
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
            self.doneButton.alpha = 0
            self.rearrangeButton.alpha = 1
            self.restoreButton.alpha = 1
        })
    }
    
    // 元のプレイリストを復元します。.
    @IBAction func restorePlaylist() {
        // プレイリストビューコントローラにそれを行うように指示する.
        playlistViewController.restorePlaylist()
    }
}

