//
//  AppDelegate.swift
//  nerugaku1
//
//  Created by Shunsuke Takagi on 2020/07/21.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


//    追加
    var window: UIWindow?
    var audioSessionObserver: Any!
    
    let session: AVAudioSession = AVAudioSession.sharedInstance()


//    削除
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
    
//    以下に変更
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Observe AVAudioSession notifications.
        
        // Note that a real app might need to observe other AVAudioSession notifications, too,
        // especially if it needs to properlay handle playback interruptions when the app is
        // in the background.
        let notificationCenter = NotificationCenter.default
        
        audioSessionObserver = notificationCenter.addObserver(forName: AVAudioSession.mediaServicesWereResetNotification,
                                                              object: nil,
                                                              queue: nil) { [unowned self] _ in
            self.setUpAudioSession()
        }
        
        // Configure the audio session initially.
        setUpAudioSession()
        
        return true
    }
    


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    追加
    // A helper method that configures the app's audio session.
    // Note that the `.longForm` policy indicates that the app's audio output should use AirPlay 2
    // for playback.
    /// - Tag: LongForm
    private func setUpAudioSession() {

        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, policy: .longForm)
        } catch {
            print("Failed to set audio session route sharing policy: \(error)")
        }
    }


}

