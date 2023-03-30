//
//  ModalView.swift
//  15ya15days
//
//  Created by 허준혁 on 2023/03/29.
//

import SwiftUI
import AVKit

struct InterviewView: View {

    var body: some View {
        VStack {
            Spacer()

            HStack(alignment: .top) {
                Image("window_controll")
                    .offset(x: 18, y: 5)
                Spacer()
            }

            Spacer()

            Image("line")

            Spacer()
            Spacer()

            let player = AVPlayer()
            VideoPlayer(player: player)
//                .scaledToFit()
                .frame(width: 930, height: 280)
                .onAppear{
                    if player.currentItem == nil {
                        let item = AVPlayerItem(url: Bundle.main.url(forResource: "interview", withExtension: "mp4")!)
                        player.replaceCurrentItem(with: item)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        player.play()
                    })
                }

            Image("interview_infomation")
                .resizable()
                .scaledToFit()

            Spacer()
            Spacer()
        }
    }
}
