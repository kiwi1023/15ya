//
//  MailContentsView.swift
//  15ya_OurStory
//
//  Created by Kiwon Song on 2023/03/28.
//

import SwiftUI

struct MailContentsView: View {
    var body: some View {
        Text("1")
            .onAppear {
                MusicPlayManager.shared.playSound()
            }
            .onDisappear {
                MusicPlayManager.shared.stopSound()
            }
    }
}

struct MailContentsView_Previews: PreviewProvider {
    static var previews: some View {
        MailContentsView()
    }
}
