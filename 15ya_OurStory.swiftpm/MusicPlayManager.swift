//
//  MusicPlayManager.swift
//  15ya_OurStory
//
//  Created by Kiwon Song on 2023/03/28.
//

import Foundation
import AVKit

class MusicPlayManager {
    static let shared = MusicPlayManager()
    var player: AVAudioPlayer?

    private init() {}
    
    func playSound() {

        guard let url = Bundle.main.url(forResource: "I believe - 신승훈", withExtension: ".mp3") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
